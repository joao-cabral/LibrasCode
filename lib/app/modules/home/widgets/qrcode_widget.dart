import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';
import 'custom_border_painter.dart';

class QRCodeComponent extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final HomeController controller;
  const QRCodeComponent(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.6,
      width: screenWidth * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Image.asset(
                  'assets/images/qrcode_example.png',
                ),
              ),
              CustomPaint(
                size: Size(screenWidth * 0.7, screenHeight * 0.32),
                painter: CustomBorderPainter(),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          //Button to scan qrcode
          SizedBox(
            width: screenHeight * 0.7,
            child: TextButton(
              style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: Colors.blue),
              onPressed: () => Modular.to
                  .pushNamed(
                    '/qr-code/',
                  )
                  .then((value) => controller.getAll()),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'SCAN QRCODE',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
