import 'dart:convert'; // Import this to convert data to JSON
import 'package:shared_preferences/shared_preferences.dart';

class RequestData {
  static List<Map<String, String>> allRequest = [];
  static List<Map<String, String>> myRequest = [];

  // Step 2.1: Add a method to save the requests to SharedPreferences
  static Future<void> saveRequests() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert list of maps (allRequest) to JSON string
    String allRequestsJson = jsonEncode(allRequest);
    await prefs.setString('allRequest', allRequestsJson); // Save as string
  }

  // Step 2.2: Add a method to load the requests from SharedPreferences
  static Future<void> loadRequests() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? allRequestsJson = prefs.getString('allRequest'); // Load the JSON string

    if (allRequestsJson != null) {
      List<dynamic> jsonData = jsonDecode(allRequestsJson); // Decode JSON string to list
      allRequest = List<Map<String, String>>.from(
        jsonData.map((item) => Map<String, String>.from(item)),
      );
    }
  }

  // Add a new request to the list and save it
  static Future<void> addResource(String name, String experience, String role, String description) async {
    Map<String, String> newRequest = {
      "name": name,
      "experience": experience,
      "role": role,
      "description": description,
    };
    allRequest.add(newRequest);
    await saveRequests(); // Save the updated list to SharedPreferences
  }
}
