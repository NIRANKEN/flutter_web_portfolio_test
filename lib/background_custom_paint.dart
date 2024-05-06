import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio_test/constants.dart';

class BackgroundCustomPaint extends StatelessWidget {
  const BackgroundCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundCustomPainter(context: context),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.9,
      ),
    );
  }
}

class BackgroundCustomPainter extends CustomPainter {
  const BackgroundCustomPainter({required this.context});
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size / 2;
    final paint = Paint()..color = Constants.drawColor;
    // 編集前のキャンバスの状態を保存
    canvas.save();

    final minDeltaSize =
        center.width < center.height ? center.width : center.height;
    canvas.translate(center.width, center.height);
    // 90度回転
    canvas.rotate(pi / 4);

    // 左にひし形
    canvas.drawRRect(
        RRect.fromLTRBR(-1.5 * minDeltaSize, 1 * minDeltaSize, 1 * minDeltaSize,
            3.5 * minDeltaSize, const Radius.circular(4)),
        paint);

    // 右に網線表現
    for (int i = -6; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
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
    // 保存したキャンバスの状態に戻す
    canvas.restore();

    // 左上の円
    canvas.drawCircle(
        Offset(-size.width / 16, -size.height / 3), minDeltaSize, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
