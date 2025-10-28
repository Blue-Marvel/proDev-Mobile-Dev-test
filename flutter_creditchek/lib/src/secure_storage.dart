import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class SecureDataStorage {
  final _secureStorage = const FlutterSecureStorage();
  late Box<String> _box;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _box = await Hive.openBox<String>('creditchek_cache');
  }

  Future<void> save(String key, String data) async {
    await _box.put(key, data);
  }

  Future<String?> get(String key) async {
    return _box.get(key);
  }
}
