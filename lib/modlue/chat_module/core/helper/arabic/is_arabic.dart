var arabic = RegExp(r'[\u0750-\u077F]');

bool isArabic(String text) {
  if (arabic.hasMatch(text)) {
    return true;
  } else {
    return false;
  }
}
