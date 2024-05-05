import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatelessWidget {
  final User user;

  QRPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final qrData = user.uid;
    final dbRef = FirebaseDatabase.instance.ref();
    dbRef.child('users/${user.uid}/qrCode').set(qrData);

    return Scaffold(
      appBar: AppBar(title: Text("Your QR Code")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            data: qrData,
            version: QrVersions.auto,
            size: 200.0,
          ),
          Text(user.uid)
        ],
      )),
    );
  }
}
