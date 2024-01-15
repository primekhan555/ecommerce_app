// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../constants/app_boxes.dart';
import '../constants/theme_constants.dart';

class ThemeProvider with ChangeNotifier {
  final Box _box = Hive.box(AppBoxes.appBox);
  int _themeId = 0;
  ThemeProvider() {
    _loadCurrentTheme();
  }
  int get themeId => _themeId;

  void changeTheme(int value) {
    if (value == _themeId) return;
    _themeId = value;
    _box.put(ThemeConstants.theme, value);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    _themeId = _box.get(ThemeConstants.theme, defaultValue: _themeId);
    notifyListeners();
  }
}
