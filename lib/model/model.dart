// To parse this JSON data, do
//
//     final jobCategoriesResponse = jobCategoriesResponseFromJson(jsonString);

import 'dart:convert';

JobCategoriesResponse jobCategoriesResponseFromJson(String str) =>
    JobCategoriesResponse.fromJson(json.decode(str));

String jobCategoriesResponseToJson(JobCategoriesResponse data) =>
    json.encode(data.toJson());

class JobCategoriesResponse {
  List<Result> results;
  String jobCategoriesResponseClass;

  JobCategoriesResponse({
    required this.results,
    required this.jobCategoriesResponseClass,
  });

  factory JobCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      JobCategoriesResponse(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        jobCategoriesResponseClass: json["__CLASS__"],
      );

  

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "__CLASS__": jobCategoriesResponseClass,
      };
}

class Result {
  String tag;
  String label;
  Class resultClass;

  Result({
    required this.tag,
    required this.label,
    required this.resultClass,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        tag: json["tag"],
        label: json["label"],
        resultClass: classValues.map[json["__CLASS__"]]!,
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "label": label,
        "__CLASS__": classValues.reverse[resultClass],
      };
}

enum Class { ADZUNA_API_RESPONSE_CATEGORY }

final classValues = EnumValues(
    {"Adzuna::API::Response::Category": Class.ADZUNA_API_RESPONSE_CATEGORY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
