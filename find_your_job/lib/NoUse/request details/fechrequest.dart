// File: fetch_request.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Api/api.dart';

class RequestData {
  RequestData({
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.jobType,
    required this.datePosted,
  });

  final String title;
  final String company;
  final String location;
  final String description;
  final String jobType;
  final String datePosted;

  static List<RequestData> allRequest = [];
  static List<RequestData> myRequest = [];

  // Updated API endpoint and key
  static const String apiKey = "ee3d4fbf15mshd0084085fab44abp1fda80jsn69861000b007";
  static const String apiUrl = "https://jsearch.p.rapidapi.com/search";

  static Future<List<Job>> fetchRequestsFromApi() async {
    final url = Uri.parse('$apiUrl?query=Software%20Engineer&page=1&num_pages=1');
    final headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'jsearch.p.rapidapi.com',
      'Content-Type': 'application/json'
    };

    try {
      print('Making API request to: $url');
      final response = await http.get(url, headers: headers);
      print('Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        print('Decoded JSON: $jsonResponse');
        
        if (jsonResponse.containsKey('data')) {
          List<dynamic> jobsList = jsonResponse['data'];
          List<Job> jobs = jobsList.map((jobJson) => Job(
            id: jobJson['job_id'] ?? '',
            site: Site.LINKEDIN,
            jobUrl: jobJson['job_apply_link'] ?? '',
            jobUrlDirect: jobJson['job_apply_link'] ?? '',
            title: jobJson['job_title'] ?? '',
            company: jobJson['employer_name'] ?? '',
            location: jobJson['job_city'] ?? '',
            jobType: jobJson['job_employment_type'] ?? '',
            datePosted: jobJson['job_posted_at_datetime_utc'] ?? '',
            salarySource: SalarySource.EMPTY,
            interval: Interval.EMPTY,
            minAmount: '',
            maxAmount: '',
            currency: Currency.EMPTY,
            isRemote: IsRemote.EMPTY,
            jobLevel: '',
            jobFunction: '',
            companyIndustry: '',
            listingType: ListingType.EMPTY,
            emails: Emails.EMPTY,
            description: jobJson['job_description'] ?? '',
            companyUrl: '',
            companyUrlDirect: '',
            companyAddresses: '',
            companyNumEmployees: '',
            companyRevenue: '',
            companyDescription: '',
            logoPhotoUrl: jobJson['employer_logo'] ?? '',
            bannerPhotoUrl: '',
            ceoName: '',
            ceoPhotoUrl: '',
          )).toList();

          allRequest = jobs.map((job) => RequestData.fromJob(job)).toList();
          return jobs;
        } else {
          print('Response does not contain data key');
          return [];
        }
      } else if (response.statusCode == 200) {
        print('Rate limit exceeded. Please try again later.');
        // Return some cached data or show appropriate message
        return [];
      } else {
        print('API request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e, stackTrace) {
      print("Error fetching data: $e");
      print("Stack trace: $stackTrace");
      return [];
    }
  }

  factory RequestData.fromJob(Job job) => RequestData(
        title: job.title,
        company: job.company,
        location: job.location,
        description: job.description,
        jobType: job.jobType,
        datePosted: job.datePosted,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'company': company,
        'location': location,
        'description': description,
        'jobType': jobType,
        'datePosted': datePosted,
      };

  static void addToMyRequest(RequestData request) {
    if (!myRequest.contains(request)) myRequest.add(request);
  }

  static void removeFromMyRequest(RequestData request) {
    myRequest.removeWhere((item) =>
        item.title == request.title && item.company == request.company);
  }

  static bool isInMyRequest(RequestData request) => myRequest.any(
        (item) => item.title == request.title && item.company == request.company);
}
