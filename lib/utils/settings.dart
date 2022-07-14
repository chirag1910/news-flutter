import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static String countryCodeKey = "settings_cck";
  static String languageKey = "settings_lk";

  static Future<String?> getCountryCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(countryCodeKey);
  }

  static Future<void> setCountryCode(String countryCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(countryCodeKey, countryCode);
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageKey);
  }

  static Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, language);
  }
}
