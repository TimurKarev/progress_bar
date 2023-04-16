import 'package:flutter/material.dart';
import 'package:progress_bar/entities/progress_bar_model.dart';
import 'package:progress_bar/notifiers/progress_bar_notifier.dart';
import 'package:progress_bar/presentation/my_app.dart';

// TODO: add DI
final ProgressBarNotifier progressBarNotifier = ProgressBarNotifier(
  ProgressBarEntity.init(),
);

void main() {
  runApp(
    const MyApp(),
  );
}
