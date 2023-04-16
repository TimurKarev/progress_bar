import 'dart:math';

double roundDouble(double value, [int places = 1]) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

double getRandomDoubleInRange(double min, double max) {
  final random = Random();
  return roundDouble(min + random.nextDouble() * (max - min));
}

int getRandomIntInRange(int min, int max) {
  final random = Random();
  return min + random.nextInt(max - min + 1);
}
