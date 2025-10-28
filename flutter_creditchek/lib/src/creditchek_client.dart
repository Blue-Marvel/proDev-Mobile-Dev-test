import 'dart:convert';
import 'package:flutter_creditchek/src/secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'models/credit_report.dart';
import 'utils/crypto_helper.dart';

class CreditChekClient {
  final String _token;
  final _storage = SecureDataStorage();
  final _crypto = CryptoHelper();

  CreditChekClient._(this._token);

  /// Initialize SDK with token
  static Future<CreditChekClient> initialize(String token) async {
    final client = CreditChekClient._(token);
    await client._crypto.init();
    await client._storage.init();
    return client;
  }

  /// Fetch credit report from API and store securely
  Future<CreditReport?> getCreditReport(String bvn) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    final cacheKey = 'credit_report_$bvn';
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No internet, return decrypted cached data
      final encryptedData = await _storage.get(cacheKey);
      if (encryptedData == null) return null;
      final decrypted = _crypto.decryptData(encryptedData);
      return CreditReport.fromJson(jsonDecode(decrypted));
    }

    // Fetch from API
    final url = Uri.parse(
      'https://api.creditchek.africa/v1/credit/premium?bvn=$bvn',
    );
    final response = await http.get(url, headers: {'token': _token});

    if (response.statusCode == 401) {
      throw Exception('Invalid token');
    }

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      final report = CreditReport.fromJson(jsonResponse);

      // Encrypt before saving locally
      final encrypted = _crypto.encryptData(jsonEncode(report.toJson()));
      await _storage.save(cacheKey, encrypted);

      return report;
    } else {
      throw Exception('Failed to fetch credit report');
    }
  }
}
