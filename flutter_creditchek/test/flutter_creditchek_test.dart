import 'package:flutter_creditchek/src/utils/crypto_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

// ✅ Proper mock class
class MockPathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    // Return a temporary local path for testing
    return '.';
  }
}

void main() {
  late CryptoHelper crypto;

  setUpAll(() {
    // ✅ Set mock path provider before anything that uses it
    PathProviderPlatform.instance = MockPathProviderPlatform();
  });

  setUp(() {
    crypto = CryptoHelper();
  });
}
