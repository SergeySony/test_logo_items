import 'dart:math';

class InitialDataProvider {

  Future<bool> getData() async {
    await Future.delayed(const Duration(seconds: 5));
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    if (randomNumber < 80) {
      return true;
    } else {
      return false;
    }
  }
}