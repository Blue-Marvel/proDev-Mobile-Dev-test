import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class SecureDataStorage {
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
