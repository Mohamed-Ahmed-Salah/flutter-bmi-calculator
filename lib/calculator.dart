import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  double _bmi;

  Calculator({this.height, this.weight});

  String BMIcalculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweright';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have heigher than normal body weight. Hit the gym';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job king!';
    } else {
      return 'You have a lower than normal body weight. Eat more and stay healthy!';
    }
  }
}
