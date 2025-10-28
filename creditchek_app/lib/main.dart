import 'package:flutter/material.dart';
// import 'package:creditchek_sdk/creditchek_sdk.dart';
import 'package:flutter_creditchek/flutter_creditchek.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = await CreditChekClient.initialize(
    'nAuuVJ2T2kzlf6s8tNoOcqpBpSf1tfMowIJyTSIFDb7RNMchQXb44D3Po5GyQYKG',
  );
  runApp(MyApp(client));
}

class MyApp extends StatefulWidget {
  final CreditChekClient client;
  const MyApp(this.client, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   // widget.client.getCreditReport();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('CreditChek Demo')),
        body: FutureBuilder(
          future: widget.client.getCreditReport('12345678901'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final report = snapshot.data;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('Name: ${report?.data.name ?? ""}'),
                Text('Address: ${report?.data.address ?? ""}'),
                // Text('Score: ${report?.data["score"] ?? ""}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
