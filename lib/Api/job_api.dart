import 'dart:async';
import 'dart:convert';
import 'package:find_your_job/model/model.dart';
import 'package:http/http.dart' as http;


Future<JobCategoriesResponse> fetchJob() async {
  final response = await http
        .get(Uri.parse('https://api.adzuna.com/v1/api/jobs/in/categories?app_id=c531865e&app_key=3ba9a7e1a6844672a945ff39c0aafa20'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return JobCategoriesResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load welcome');
  }
}