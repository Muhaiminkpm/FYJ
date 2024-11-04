// lib/utils/shared_preferences_helper.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'modelprofile.dart';

class SharedPreferencesHelper {
  static const String _profileKey = 'user_profile';

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
}
