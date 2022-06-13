// ignore_for_file: unused_field

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('ar', '');

  Locale get locale => _locale;

  void getStoredLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _locale = Locale(prefs.getString('lan') ?? 'en', '');
    notifyListeners();
  }

  void setlocale(String newLocale) {
    _locale = Locale(newLocale, '');
    notifyListeners();
  }
}
