import 'package:progress_bar/constants/app_constants.dart';
import 'package:progress_bar/utils/app_utils.dart' as utils;

class ProgressBarEntity {
  const ProgressBarEntity({
    required this.pauseValues,
    required this.pauseDuration,
  });

  factory ProgressBarEntity.init() {
    final List<double> pauseValues = [];
    final List<int> pauseDuration = [];

    for (int i = 0; i < AppConstants.pauseNumber; i++) {
      pauseValues.add(utils.getRandomDoubleInRange(0.1, 0.9));
    }
    pauseValues.sort();

    for (int i = 0; i < AppConstants.pauseNumber; i++) {
      pauseDuration.add(utils.getRandomIntInRange(1000, 2000));
    }

    return ProgressBarEntity(
      pauseValues: pauseValues,
      pauseDuration: pauseDuration,
    );
  }

  final List<double> pauseValues;
  final List<int> pauseDuration;
}
