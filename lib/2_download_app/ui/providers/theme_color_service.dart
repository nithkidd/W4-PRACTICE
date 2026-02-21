import 'package:flutter/material.dart';
import 'theme_color_provider.dart';

// theme color service
class ThemeColorService extends ChangeNotifier {
  ThemeColor _color = currentThemeColor;

  ThemeColor get color => _color;

  void setColor(ThemeColor newColor) {
    _color = newColor;
    currentThemeColor = newColor;
    notifyListeners();
  }
} 