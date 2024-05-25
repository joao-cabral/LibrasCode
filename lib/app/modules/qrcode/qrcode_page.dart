import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'qrcode_controller.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({super.key});

  @override
  State<QRCodePage> createState() => QRCodePageState();
}

class QRCodePageState extends State<QRCodePage> {
  final controller = QRCodeController();

  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isReadyScan = false;

  //Get first qrcode scanned if contains youtube
  void onQRView(QRViewController qrViewController) {
    this.qrViewController = qrViewController;

    qrViewController.scannedDataStream.firstWhere((data) {
      if (data.code != null && data.code!.contains('youtube')) {
        Modular.to.pushNamed(
          '/video-player/?videoId=${controller.handleURL(data.code!)}',
        );
        return true;
      }
      return false;
    });
  }

  @override
  void dispose() {
    qrViewController?.stopCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Modular.to.pop(),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: const Text(
          'Voltar',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: _buildQrView(context),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          elevation: 8,
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () => {qrViewController?.toggleFlash()},
          tooltip: 'QRCode',
          child: const Icon(
            Icons.flashlight_on_sharp,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
