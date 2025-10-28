📘 Flutter CreditChek SDK

The Flutter CreditChek SDK provides a simple and secure way to integrate CreditChek Africa’s Individual Premium Credit Report API into your Flutter applications.

It handles:

🔐 Secure data encryption & storage (AES-based)

🌐 Online + Offline credit report fetching

⚙️ Easy SDK initialization and use

🧩 Features

✅ Initialize the SDK with your API token
✅ Fetch credit reports using BVN
✅ Automatically cache & encrypt data for offline access
✅ Retrieve cached reports when offline
✅ Built-in network check using connectivity_plus

🚀 Installation

Add the SDK to your pubspec.yaml:

dependencies:
flutter_creditchek:
git:
url: https://github.com/your-username/flutter_creditchek.git

Then run:

flutter pub get

⚙️ Initialization

Before using the SDK, initialize it with your API token (from CreditChek Africa):

import 'package:flutter_creditchek/flutter_creditchek.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();

final client = await CreditChekClient.initialize('YOUR_API_TOKEN');
runApp(MyApp(client: client));
}

📊 Fetching a Credit Report

Once initialized, you can fetch a user’s credit report using their BVN.

final report = await client.getCreditReport('12345678901');

if (report != null) {
print('Name: ${report.name}');
print('Score: ${report.score}');
print('Status: ${report.status}');
} else {
print('No cached report found or failed to fetch.');
}

📴 Offline Mode

If the device has no internet connection, the SDK automatically retrieves and decrypts the last cached credit report for the given BVN.

final report = await client.getCreditReport('12345678901');
// This will return cached data if offline.

🔐 Security

The SDK uses AES-256 encryption to store credit reports securely on the device.
Your API token and all cached data remain protected even if the user goes offline.

🧪 Running Tests

To run unit tests (including SDK initialization and offline/online report fetching):

flutter test

Test Coverage

✅ SDK Initialization

✅ Online API Fetch (mocked)

✅ Offline Cache Retrieval (mocked)

🧠 Example Output
Name: John Doe
Score: 750
Status: Good

If offline:

No internet, returning cached data...
Name: John Doe
Score: 750
Status: Good (from cache)

🛠️ Project Structure
lib/
├─ src/
│ ├─ creditchek_client.dart # Core SDK logic
│ ├─ models/
│ │ └─ credit_report.dart # Data model
│ ├─ storage/
│ │ └─ secure_storage.dart # Secure local storage
│ ├─ utils/
│ │ └─ crypto_helper.dart # AES encryption/decryption
└─ flutter_creditchek.dart # Public SDK export

🧾 API Reference
Method Description Returns
CreditChekClient.initialize(token) Initializes SDK with your CreditChek API token Future<CreditChekClient>
getCreditReport(bvn) Fetches and securely caches the credit report Future<CreditReport?>
💡 Example Integration
class CreditReportScreen extends StatelessWidget {
final CreditChekClient client;

const CreditReportScreen({required this.client});

@override
Widget build(BuildContext context) {
return FutureBuilder(
future: client.getCreditReport('12345678901'),
builder: (context, snapshot) {
if (!snapshot.hasData) {
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

🧑‍💻 Contributing

Contributions are welcome!
Please submit a pull request or open an issue if you find a bug or have suggestions.

📄 License

This project is licensed under the MIT License.
See the LICENSE
file for more details.

convert this to a .md file
