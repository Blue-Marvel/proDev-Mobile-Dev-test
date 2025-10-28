# 📘 Flutter CreditChek SDK

The **Flutter CreditChek SDK** provides a simple and secure way to integrate CreditChek Africa’s Individual Premium Credit Report API into your Flutter applications.

It handles:
* 🔐 **Secure data encryption & storage** (AES-based)
* 🌐 **Online + Offline** credit report fetching
* ⚙️ **Easy SDK initialization** and use
* ✅ **Built-in network check** using `connectivity_plus`

---

## 🚀 Installation

Add the SDK to your `pubspec.yaml` file by referencing the git repository:

```yaml
dependencies:
  flutter_creditchek:
    git:
      url: [https://github.com/Blue-Marvel/proDev-Mobile-Dev-test/tree/main/flutter_creditchek](https://github.com/Blue-Marvel/proDev-Mobile-Dev-test/tree/main/flutter_creditchek)
Then run the following command in your terminal:Bashflutter pub get
⚙️ UsageInitializationBefore using the SDK, you must initialize it with your API token (obtained from CreditChek Africa). This should be done once, typically in your main function.Dartimport 'package:flutter_creditchek/flutter_creditchek.dart';
import 'package:flutter/widgets.dart'; // Required for WidgetsFlutterBinding

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the SDK with your API token
  final client = await CreditChekClient.initialize('YOUR_API_TOKEN');

  runApp(MyApp(client: client));
}
Fetching a Credit ReportOnce initialized, you can fetch a user’s credit report using their BVN (Bank Verification Number).Dart// client is the initialized CreditChekClient instance
final report = await client.getCreditReport('12345678901'); 

if (report != null) {
  print('Name: ${report.name}');
  print('Score: ${report.score}');
  print('Status: ${report.status}');
} else {
  print('No cached report found or failed to fetch.');
}
📴 Offline Mode & SecurityIf the device has no internet connection, the SDK automatically retrieves and decrypts the last cached credit report for the given BVN.The SDK uses AES-256 encryption to store credit reports securely on the device, ensuring your API token and all cached data remain protected.Dart// This call will return cached data if the device is currently offline
final report = await client.getCreditReport('12345678901');
💡 Example IntegrationHere's an example of how to use the SDK within a Flutter widget using a FutureBuilder to handle the asynchronous fetching:Dartimport 'package:flutter/material.dart';
import 'package:flutter_creditchek/flutter_creditchek.dart';

class CreditReportScreen extends StatelessWidget {
  final CreditChekClient client;

  const CreditReportScreen({required this.client, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CreditReport?>(
      future: client.getCreditReport('12345678901'),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          // Display a loading indicator or a message if no data is available
          return const Center(child: CircularProgressIndicator());
        }

        final report = snapshot.data!;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${report.name}'),
            Text('Score: ${report.score}'),
            Text('Status: ${report.status}'),
          ],
        );
      },
    );
  }
}
🧪 Running TestsTo run the unit tests (which cover SDK initialization, offline/online report fetching, and caching logic), execute the following command:Bashflutter test
Test Coverage Highlights:✅ SDK Initialization✅ Online API Fetch (mocked)✅ Offline Cache Retrieval (mocked)🧾 API ReferenceMethodDescriptionReturnsCreditChekClient.initialize(token)Initializes SDK with your CreditChek API token.Future<CreditChekClient>getCreditReport(bvn)Fetches a credit report from the API, securely caches it, and retrieves the cached report if offline.Future<CreditReport?>🛠️ Project StructureThe core logic of the SDK is organized as follows:lib/
├─ src/
│ ├─ creditchek_client.dart # Core SDK logic
│ ├─ models/
│ │ └─ credit_report.dart # Data model
│ ├─ storage/
│ │ └─ secure_storage.dart # Secure local storage
│ ├─ utils/
│ │ └─ crypto_helper.dart # AES encryption/decryption
└─ flutter_creditchek.dart # Public SDK export
🧑‍💻 ContributingContributions are welcome! Please submit a pull request or open an issue if you find a bug or have suggestions.📄 LicenseThis project is licensed under the MIT License. See the LICENSE file for more details
