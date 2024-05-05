import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zarvis_genix_assignment/screens/login_page.dart';

import 'firebase_options.dart';

void _checkCameraPermission() async {
  PermissionStatus status = await Permission.camera.status;
  if (!status.isGranted) {
    await Permission.camera.request();
  }
}

void _checkFilePermission() async {
  PermissionStatus status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  _checkCameraPermission();
  _checkFilePermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
