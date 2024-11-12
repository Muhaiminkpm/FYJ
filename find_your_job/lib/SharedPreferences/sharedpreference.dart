// lib/utils/shared_preferences_helper.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../profile/model_profile.dart';


class SharedPreferencesHelper {
  static const String _profileKey = 'user_profile';
  static const String _isLoggedInkey = 'is_logged_in';
  static const String _darkModeKey = 'dark_mode';

 
  static Future<void> saveProfile(ProfileModel profile) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String profileJson = jsonEncode(profile.toMap());
      await prefs.setString(_profileKey, profileJson);
    } catch (e) {
      print('Error saving profile: $e');
      rethrow;
    }
  }

  static Future<ProfileModel?> getProfile() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? profileJson = prefs.getString(_profileKey);
      if (profileJson != null) {
        final Map<String, dynamic> profileMap = jsonDecode(profileJson);
        return ProfileModel.fromMap(profileMap);
      }
    } catch (e) {
      print('Error loading profile: $e');
    }
    return null;
  }

  static Future<void> saveLoginStatus(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isLoggedInkey, isLoggedIn);
  }

  static Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getBool(_isLoggedInkey) ?? false;
  }
   static Future<void> saveDarkModeStatus(bool isDarkMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_darkModeKey, isDarkMode);
  }

  static Future<bool> getDarkModeStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkModeKey) ?? false;
  }

}
