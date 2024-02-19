import 'package:ainews/import.dart';

class ThemeController extends GetxController {
  RxBool _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
  }
}
