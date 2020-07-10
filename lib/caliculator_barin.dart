
import 'dart:math';

import 'main.dart';

class CaliculatorBrain {

  final int height;
  final int weight;

  double _BMI;

  CaliculatorBrain(this.height, this.weight);

  String caliculateBMI () {
    _BMI = weight/pow(height / 100, 2);
    print(_BMI);
    return _BMI.toStringAsFixed(1);
  }

  String getResult() {
    if (_BMI >= 25) {
      return 'Over weight';
    } else if (_BMI > 18.5) {
      return 'normal';
    }
    return 'Under weight';
  }

  String getInterpretation() {
    if (_BMI >= 25) {
      return 'Your weight is more than normal... please do some excercise';
    } else if (_BMI > 18.5) {
      return 'your BMI weight is in healthy limit... Keep it up';
    }
    return 'Opps your BMI weight is too low... Eat more !!';
  }
}