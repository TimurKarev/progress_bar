import 'package:flutter/material.dart';
import 'package:progress_bar/constants/app_constants.dart';
import 'package:progress_bar/main.dart';
import 'package:progress_bar/presentation/common/progress_bar/progress_bar_background.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.widthFactor,
  });

  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppConstants.progressBarBorderRadius),
        ),
        child: SizedBox(
          height: AppConstants.progressBarHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                isComplex: true,
                painter: _ProgressBarStripesPainter(
                  stripePrimaryColor: AppConstants.stripePrimaryColor,
                  stripeSecondaryColor: AppConstants.stripeSecondaryColor,
                  strokeWidth: AppConstants.strokeWidth,
                  strokeHeight: AppConstants.progressBarHeight,
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: progressBarNotifier,
                  builder: (_, notifier, __) {
                    return ProgressBarBackground(
                      progressBarEntity: notifier,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressBarStripesPainter extends CustomPainter {
  final Color stripePrimaryColor;
  final Color stripeSecondaryColor;
  final double strokeWidth;
  final double strokeHeight;

  _ProgressBarStripesPainter({
    required this.stripePrimaryColor,
    required this.stripeSecondaryColor,
    required this.strokeWidth,
    required this.strokeHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint primPaint = Paint()
      ..color = stripePrimaryColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Paint secPaint = Paint()
      ..color = stripeSecondaryColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    for (double x = 0; x < size.width + 10; x += strokeWidth * 2) {
      canvas.drawLine(
        Offset(x - 10, -10),
        Offset(x + strokeWidth, strokeHeight + 10),
        primPaint,
      );
      canvas.drawLine(
        Offset(x - 10 + strokeWidth, -10),
        Offset(x + strokeWidth * 2, strokeHeight + 10),
        secPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_ProgressBarStripesPainter oldDelegate) {
    return false;
  }
}
