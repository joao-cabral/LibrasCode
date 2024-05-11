import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librascode/app/core/database/sqlite_connection_factory.dart';
import 'package:librascode/app/modules/home/home_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final sqliteConnection = Modular.get<SqliteConnectionFactory>();

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isReadyScan = true;

  //Returns only videoID
  String handleURL(String value) {
    return value.split('=')[1];
  }

  void onQRView(QRViewController controller) {
    controller.scannedDataStream.listen((data) {
      if (data.code != null && data.code!.contains('youtube')) {
        Modular.to.pushNamed(
          '/video-player?videoId=${handleURL(data.code!)}',
        );
      } else {
        //call a toast with error
      }
    });
  }

  //develop
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.stopCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    sqliteConnection.openConnection();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LibrasCode',
          style: GoogleFonts.robotoCondensed(
            textStyle: const TextStyle(fontSize: 24),
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (isReadyScan)
            Center(
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.3,
                child: _buildQrView(context),
              ),
            ),
          if (!isReadyScan)
            Center(
              child: Container(
                color: Colors.grey,
                width: screenWidth * 0.6,
                height: screenHeight * 0.3,
                child: const Icon(
                  Icons.qr_code_rounded,
                  size: 68,
                ),
              ),
            ),
          SizedBox(
            width: screenWidth * 0.6,
            child: Text(
              'LEIA O QRCODE',
              style: GoogleFonts.robotoCondensed(
                textStyle: const TextStyle(fontSize: 28),
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      // floatingActionButton: SizedBox(
      //   height: 60,
      //   width: 60,
      //   child: FloatingActionButton(
      //     elevation: 8,
      //     backgroundColor: Colors.white,
      //     shape: const CircleBorder(),
      //     onPressed: () => {
      //       setState(() => isReadyScan = !isReadyScan)
      //       // Navigator.of(context).pushNamed('/video-player')
      //     },
      //     tooltip: 'QRCode',
      //     child: const Icon(
      //       Icons.qr_code_scanner_rounded,
      //       size: 35,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 600 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: onQRView,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (controller, permission) =>
          _onPermissionSet(context, controller, permission),
    );
  }

  void _onPermissionSet(
      BuildContext context, QRViewController controller, bool permission) {
    if (!permission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sem permissão para camera')),
      );
    }
  }
}
