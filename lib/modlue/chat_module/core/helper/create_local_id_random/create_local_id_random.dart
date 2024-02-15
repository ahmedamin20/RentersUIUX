import 'dart:math';

String generateRandomId(int length) {
  final random = Random();
  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String randomId = '';

  for (int i = 0; i < length; i++) {
    randomId += characters[random.nextInt(characters.length)];
  }

  return randomId;
}
