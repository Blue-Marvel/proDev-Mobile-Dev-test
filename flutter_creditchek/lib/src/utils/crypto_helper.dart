import 'dart:convert';
import 'dart:math';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Handles encryption, decryption, and key management.
class CryptoHelper {
  static const _storage = FlutterSecureStorage();

  static const _keyStorageKey = 'creditchek_encryption_key';

  late final encrypt.Key _key;

  CryptoHelper();

  /// Initialize and ensure persistent key
  Future<void> init() async {
    // Try to load existing key
    String? savedKey = await _storage.read(key: _keyStorageKey);

    if (savedKey == null) {
      // Generate new 32-byte key and store securely
      final randomKey = _generateRandomKey(32);
      await _storage.write(key: _keyStorageKey, value: randomKey);
      savedKey = randomKey;
    }

    _key = encrypt.Key.fromBase64(savedKey);
  }

  /// Encrypts a string using AES-CBC with random IV
  String encryptData(String plainText) {
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(
      encrypt.AES(_key, mode: encrypt.AESMode.cbc),
    );

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    // Combine IV + ciphertext -> Base64
    final combined = iv.bytes + encrypted.bytes;
    return base64Encode(combined);
  }

  /// Decrypts Base64-encoded string (IV + ciphertext)
  String decryptData(String base64Data) {
    final combined = base64Decode(base64Data);

    if (combined.length < 16) {
      throw ArgumentError('Invalid encrypted data: too short.');
    }

    final iv = encrypt.IV(combined.sublist(0, 16));
    final ciphertext = combined.sublist(16);

    final encrypter = encrypt.Encrypter(
      encrypt.AES(_key, mode: encrypt.AESMode.cbc),
    );
    final decrypted = encrypter.decrypt(encrypt.Encrypted(ciphertext), iv: iv);

    return decrypted;
  }

  /// Generate secure random key (Base64)
  String _generateRandomKey(int length) {
    final random = Random.secure();
    final bytes = List<int>.generate(length, (_) => random.nextInt(256));
    return base64Encode(bytes);
  }
}
