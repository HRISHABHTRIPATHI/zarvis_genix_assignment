import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController _controller;
  // final ImagePicker _imagePicker = ImagePicker();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Future<void> _scanQR() async {
  //   try {
  //     final pickedFile =
  //         await _imagePicker.getImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //       final qrText = await _controller.scannedDataStream.first;
  //       print('Scanned QR code from image: $qrText');
  //     }
  //   } catch (e) {
  //     print('Error scanning QR code from image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: _qrKey,
              onQRViewCreated: (controller) {
                _controller = controller;
                controller.scannedDataStream.listen((scanData) {
                  print('Scanned QR code: ${scanData.code}');
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Scan QR Code from Image'),
          ),
        ],
      ),
    );
  }
}
