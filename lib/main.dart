import 'package:flutter/material.dart';
import 'YoutubeCustomWidget.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: "Libras Code",
    home: ScreenQr(),
    debugShowCheckedModeBanner: false,
  ));
}

class ScreenQr extends StatefulWidget {
  @override
  _ScreenQr createState() {
    return _ScreenQr();
  }
}

class _ScreenQr extends State<ScreenQr> {
  String _barcode;

  @override
  void initState() {
     super.initState();
     scan();
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
        setState(() => _barcode = barcode);
      
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this._barcode = 'The user has not given camera permission!';
        });
      } else {
        setState(() => this._barcode = 'Error unknown $e');
      }
    } on FormatException {
      setState(() => this._barcode =
          'null, The user pressed the back button before scanning something!)');
    } catch (e) {
      setState(() => this._barcode = 'Error unknown : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Libras Code')),
      body: new Center(
        child: new FloatingActionButton.extended(
          icon: Icon(Icons.video_label),
          label: Text("Assistir"),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YoutubeCustomWidget(barcode: _barcode)),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}