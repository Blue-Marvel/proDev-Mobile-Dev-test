# Flutter CreditChek SDK



The Flutter CreditChek SDK provides a simple and secure way to integrate CreditChek Africa's Individual Premium Credit Report API into your Flutter applications.

## 🎯 Key Features

- 🔐 **Secure Data Encryption** - AES-256 encryption for cached credit reports
- 🌐 **Online + Offline Support** - Automatically handles network connectivity
- ⚡ **Easy Integration** - Simple initialization and straightforward API
- 💾 **Smart Caching** - Encrypted local storage for offline access
- 🔒 **Secure Storage** - Protected API tokens and sensitive data

---

## 📦 Installation

### Option 1: Install from Git Repository

Add the SDK to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_creditchek:
    git:
      url: https://github.com/Blue-Marvel/flutter_creditchek.git

```

### Option 2: Install from pub.dev (when published)

```yaml
dependencies:
  flutter_creditchek: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## ⚙️ Getting Started

### 1. Import the SDK

```dart
import 'package:flutter_creditchek/flutter_creditchek.dart';
```

### 2. Initialize the SDK

Initialize the SDK in your `main.dart` file **before** running your app. You'll need your API token from CreditChek Africa.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize with your CreditChek API token
  final client = await CreditChekClient.initialize('YOUR_API_TOKEN');
  
  runApp(MyApp(client: client));
}
```

> **⚠️ Important**: Always call `WidgetsFlutterBinding.ensureInitialized()` before initializing the SDK.

### 3. Pass the Client to Your App

```dart
class MyApp extends StatelessWidget {
  final CreditChekClient client;
  
  const MyApp({required this.client, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CreditChek Demo',
      home: CreditReportScreen(client: client),
    );
  }
}
```

---

## 📊 Usage Examples

### Fetching a Credit Report

Retrieve a credit report using a user's BVN (Bank Verification Number):

```dart
final report = await client.getCreditReport('12345678901');

if (report != null) {
  print('Name: ${report.name}');
  print('Score: ${report.score}');
  print('Status: ${report.status}');
} else {
  print('Failed to fetch credit report.');
}
```

### Handling Online and Offline States

The SDK automatically detects network connectivity:

- **Online**: Fetches fresh data from the API and caches it securely
- **Offline**: Retrieves the last cached report for the given BVN

```dart
final report = await client.getCreditReport('12345678901');

if (report != null) {
  // Report could be from API or cache
  print('Report retrieved successfully');
} else {
  print('No cached report available and device is offline');
}
```

### Complete Widget Example

```dart
class CreditReportScreen extends StatelessWidget {
  final CreditChekClient client;

  const CreditReportScreen({required this.client, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Report'),
      ),
      body: FutureBuilder<CreditReport?>(
        future: client.getCreditReport('12345678901'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text('No credit report available'),
            );
          }

          final report = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${report.name}', 
                     style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Score: ${report.score}', 
                     style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text('Status: ${report.status}', 
                     style: const TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }
}
```

---

## 🔐 Security Features

The SDK implements multiple layers of security:

- **AES-256 Encryption**: All cached credit reports are encrypted using industry-standard AES-256
- **Secure Storage**: API tokens and sensitive data are stored securely on the device
- **Data Protection**: Encrypted cache ensures data safety even if device security is compromised

---

## 📁 Project Structure

```
lib/
├── flutter_creditchek.dart          # Public SDK export
└── src/
    ├── creditchek_client.dart       # Core SDK logic
    ├── models/
    │   └── credit_report.dart       # Credit report data model
    ├── storage/
    │   └── secure_storage.dart      # Secure local storage implementation
    └── utils/
        └── crypto_helper.dart       # AES encryption/decryption utilities
```

---

## 📚 API Reference

### `CreditChekClient`

#### Static Methods

| Method | Description | Returns |
|--------|-------------|---------|
| `initialize(String token)` | Initializes the SDK with your CreditChek API token | `Future<CreditChekClient>` |

#### Instance Methods

| Method | Description | Returns |
|--------|-------------|---------|
| `getCreditReport(String bvn)` | Fetches a credit report by BVN. Returns cached data if offline. | `Future<CreditReport?>` |

### `CreditReport` Model

```dart
class CreditReport {
  final String name;
  final int score;
  final String status;
  // Additional fields...
}
```

---

## 🧪 Testing

Run the test suite:

```bash
flutter test
```

### Test Coverage

- ✅ SDK Initialization
- ✅ Online API Fetching (mocked)
- ✅ Offline Cache Retrieval (mocked)
- ✅ Encryption/Decryption
- ✅ Network Connectivity Handling

---

## 🔄 Example Output

### Online Mode
```
Fetching credit report for BVN: 12345678901
Name: John Doe
Score: 750
Status: Good
```

### Offline Mode
```
No internet connection. Returning cached data...
Name: John Doe
Score: 750
Status: Good (from cache)
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🆘 Support

- 📧 Email: support@creditchek.africa
- 🌐 Website: [https://creditchek.africa](https://creditchek.africa)
- 📖 Documentation: [https://docs.creditchek.africa](https://docs.creditchek.africa)

---

## 🙏 Acknowledgments

Built with ❤️ for the African fintech ecosystem.

---

**Made with Flutter 💙**
