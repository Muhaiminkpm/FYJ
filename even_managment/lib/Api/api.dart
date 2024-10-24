// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    String onetCode;
    String jobFunction;
    String seniority;

    Welcome({
        required this.onetCode,
        
        required this.jobFunction,
        required this.seniority,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        onetCode: json["onet_code"],
        jobFunction: json["job_function"],
        seniority: json["seniority"],
    );

    Map<String, dynamic> toJson() => {
        "onet_code": onetCode,
        "job_function": jobFunction,
        "seniority": seniority,
    };
}
