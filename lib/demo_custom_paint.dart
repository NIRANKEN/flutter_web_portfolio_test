import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/constants.dart';

class DemoCustomPaint extends StatelessWidget {
  const DemoCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DemoCustomPainter(context: context),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.9,
        // child: const Text("Custom Paint"),
      ),
    );
  }
}

class DemoCustomPainter extends CustomPainter {
  const DemoCustomPainter({required this.context});
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size / 2;
    final paint = Paint()..color = Constants.drawColor;
    canvas.save();
    // canvas.drawRRect(
    //     RRect.fromLTRBR(size.width - 100, size.height - 100, size.width,
    //         size.height, const Radius.circular(4)),
    //     paint);
    final minDeltaSize =
        center.width < center.height ? center.width : center.height;
    // 90度回転
    canvas.translate(center.width, center.height);
    canvas.rotate(pi / 4);
    canvas.drawRRect(
        RRect.fromLTRBR(-1.5 * minDeltaSize, 1 * minDeltaSize, 1 * minDeltaSize,
            3.5 * minDeltaSize, const Radius.circular(4)),
        paint);

    for (int i = -6; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        // canvas.drawLine(
        //     Offset((0.5 * (i + 1)) * minDeltaSize,
        //         -i * (minDeltaSize / 4) + j.toDouble()),
        //     Offset(0.5 * (i + 5) * minDeltaSize,
        //         -i * (minDeltaSize / 4) + j.toDouble()),
        //     paint);
        // canvas.drawLine(
        //     Offset(-(i - 5) * (minDeltaSize / 4) + j.toDouble(),
        //         0.5 * (i - 2) * minDeltaSize),
        //     Offset(-(i - 5) * (minDeltaSize / 4) + j.toDouble(),
        //         0.5 * (i + 3) * minDeltaSize),
        //     paint);
        canvas.drawLine(
            Offset(0, -(i + 3) * (minDeltaSize / 4) + j.toDouble()),
            Offset(size.width, -(i + 3) * (minDeltaSize / 4) + j.toDouble()),
            paint);
        canvas.drawLine(
            Offset(-(i - 5) * (minDeltaSize / 4) + j.toDouble(), -size.height),
            Offset(-(i - 5) * (minDeltaSize / 4) + j.toDouble(), size.height),
            paint);
      }
    }
    canvas.restore();

    canvas.drawCircle(
        Offset(-size.width / 16, -size.height / 3), minDeltaSize, paint);

    // canvas.drawArc(
    //     Rect.fromCenter(
    //         center: Offset(center.width, center.height),
    //         width: 250,
    //         height: 250),
    //     0.4,
    //     2 * 3.14 - 0.8,
    //     true,
    //     paint);
    // final paint = Paint()
    //   ..color = Colors.blue
    //   ..strokeWidth = 5
    //   ..style = PaintingStyle.stroke;

    // final path = Path()
    //   ..moveTo(0, 0)
    //   ..lineTo(size.width, size.height)
    //   ..moveTo(size.width, 0)
    //   ..lineTo(0, size.height);

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
