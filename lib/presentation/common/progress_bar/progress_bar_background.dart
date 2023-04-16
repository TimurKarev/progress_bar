import 'package:flutter/material.dart';
import 'package:progress_bar/constants/app_constants.dart';
import 'package:progress_bar/entities/progress_bar_model.dart';
import 'package:progress_bar/utils/app_utils.dart' as utils;

class ProgressBarBackground extends StatefulWidget {
  const ProgressBarBackground({
    super.key,
    required this.progressBarEntity,
  });

  final ProgressBarEntity progressBarEntity;

  @override
  State<ProgressBarBackground> createState() => _ProgressBarBackgroundState();
}

class _ProgressBarBackgroundState extends State<ProgressBarBackground>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 5,
      ),
      lowerBound: 0.0,
      upperBound: 1.0,
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(ProgressBarBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progressBarEntity != widget.progressBarEntity) {
      _controller.reset();
      _controller.forward();
      currentIndex = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: AnimatedBuilder(
        builder: (_, __) {
          if (currentIndex < widget.progressBarEntity.pauseValues.length &&
              utils.roundDouble(_controller.value) ==
                  widget.progressBarEntity.pauseValues[currentIndex]) {
            _controller.stop(canceled: false);
            Future.delayed(
                Duration(
                    milliseconds: widget
                        .progressBarEntity.pauseDuration[currentIndex]), () {
              currentIndex++;
              _controller.forward();
            });
          }
          return _Content(value: _controller.value);
        },
        animation: _controller,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.value,
  });

  final double value;

  double get _value {
    if (value < 0.0) {
      return 1.0;
    }
    if (value > 1.0) {
      return 0.0;
    }
    return 1 - value;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: _value,
      child: Container(
        color: AppConstants.barBackgroundColor,
      ),
    );
  }
}
