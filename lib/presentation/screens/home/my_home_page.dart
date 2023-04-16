import 'package:flutter/material.dart';
import 'package:progress_bar/main.dart';
import 'package:progress_bar/presentation/common/progress_bar/progress_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TODO: move from here and make widget staless
  @override
  void dispose() {
    progressBarNotifier.dispose();
    super.dispose();
  }

  void _restart() {
    progressBarNotifier.restart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: ProgressBar(
          widthFactor: 0.9,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _restart,
        child: const Icon(Icons.update),
      ),
    );
  }
}
