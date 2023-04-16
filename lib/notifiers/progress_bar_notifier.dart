import 'package:flutter/cupertino.dart';
import 'package:progress_bar/entities/progress_bar_model.dart';

class ProgressBarNotifier extends ValueNotifier<ProgressBarEntity> {
  ProgressBarNotifier(ProgressBarEntity value) : super(value);

  void restart() {
    value = ProgressBarEntity.init();
    notifyListeners();
  }
}
