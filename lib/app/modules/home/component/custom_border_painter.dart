import 'package:flutter/material.dart';

class CustomBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    // Tamanho das pontas das bordas
    const cornerSize = 20.0;

    // Desenha as bordas nos quatro cantos
    // Canto superior esquerdo
    canvas.drawLine(const Offset(0, 0), const Offset(0, cornerSize), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(cornerSize, 0), paint);

    // Canto superior direito
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width - cornerSize, 0), paint);
    canvas.drawLine(
        Offset(size.width, 0), Offset(size.width, cornerSize), paint);

    // Canto inferior esquerdo
    canvas.drawLine(
        Offset(0, size.height), Offset(0, size.height - cornerSize), paint);
    canvas.drawLine(
        Offset(0, size.height), Offset(cornerSize, size.height), paint);

    // Canto inferior direito
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width, size.height - cornerSize), paint);
    canvas.drawLine(Offset(size.width, size.height),
        Offset(size.width - cornerSize, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
