// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    List<Job> jobs;
    bool status;

    Welcome({
        required this.jobs,
        required this.status,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
        "status": status,
    };
}

class Job {
    String id;
    Site site;
    String jobUrl;
    String jobUrlDirect;
    String title;
    String company;
    String location;
    String jobType;
    String datePosted;
    SalarySource salarySource;
    Interval interval;
    String minAmount;
    String maxAmount;
    Currency currency;
    IsRemote isRemote;
    String jobLevel;
    String jobFunction;
    String companyIndustry;
    ListingType listingType;
    Emails emails;
    String description;
    String companyUrl;
    String companyUrlDirect;
    String companyAddresses;
    String companyNumEmployees;
    String companyRevenue;
    String companyDescription;
    String logoPhotoUrl;
    String bannerPhotoUrl;
    String ceoName;
    String ceoPhotoUrl;

    Job({
        required this.id,
        required this.site,
        required this.jobUrl,
        required this.jobUrlDirect,
        required this.title,
        required this.company,
        required this.location,
        required this.jobType,
        required this.datePosted,
        required this.salarySource,
        required this.interval,
        required this.minAmount,
        required this.maxAmount,
        required this.currency,
        required this.isRemote,
        required this.jobLevel,
        required this.jobFunction,
        required this.companyIndustry,
        required this.listingType,
        required this.emails,
        required this.description,
        required this.companyUrl,
        required this.companyUrlDirect,
        required this.companyAddresses,
        required this.companyNumEmployees,
        required this.companyRevenue,
        required this.companyDescription,
        required this.logoPhotoUrl,
        required this.bannerPhotoUrl,
        required this.ceoName,
        required this.ceoPhotoUrl,
    });

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        site: siteValues.map[json["site"]]!,
        jobUrl: json["job_url"],
        jobUrlDirect: json["job_url_direct"],
        title: json["title"],
        company: json["company"],
        location: json["location"],
        jobType: json["job_type"],
        datePosted: json["date_posted"],
        salarySource: salarySourceValues.map[json["salary_source"]]!,
        interval: intervalValues.map[json["interval"]]!,
        minAmount: json["min_amount"],
        maxAmount: json["max_amount"],
        currency: currencyValues.map[json["currency"]]!,
        isRemote: isRemoteValues.map[json["is_remote"]]!,
        jobLevel: json["job_level"],
        jobFunction: json["job_function"],
        companyIndustry: json["company_industry"],
        listingType: listingTypeValues.map[json["listing_type"]]!,
        emails: emailsValues.map[json["emails"]]!,
        description: json["description"],
        companyUrl: json["company_url"],
        companyUrlDirect: json["company_url_direct"],
        companyAddresses: json["company_addresses"],
        companyNumEmployees: json["company_num_employees"],
        companyRevenue: json["company_revenue"],
        companyDescription: json["company_description"],
        logoPhotoUrl: json["logo_photo_url"],
        bannerPhotoUrl: json["banner_photo_url"],
        ceoName: json["ceo_name"],
        ceoPhotoUrl: json["ceo_photo_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "site": siteValues.reverse[site],
        "job_url": jobUrl,
        "job_url_direct": jobUrlDirect,
        "title": title,
        "company": company,
        "location": location,
        "job_type": jobType,
        "date_posted": datePosted,
        "salary_source": salarySourceValues.reverse[salarySource],
        "interval": intervalValues.reverse[interval],
        "min_amount": minAmount,
        "max_amount": maxAmount,
        "currency": currencyValues.reverse[currency],
        "is_remote": isRemoteValues.reverse[isRemote],
        "job_level": jobLevel,
        "job_function": jobFunction,
        "company_industry": companyIndustry,
        "listing_type": listingTypeValues.reverse[listingType],
        "emails": emailsValues.reverse[emails],
        "description": description,
        "company_url": companyUrl,
        "company_url_direct": companyUrlDirect,
        "company_addresses": companyAddresses,
        "company_num_employees": companyNumEmployees,
        "company_revenue": companyRevenue,
        "company_description": companyDescription,
        "logo_photo_url": logoPhotoUrl,
        "banner_photo_url": bannerPhotoUrl,
        "ceo_name": ceoName,
        "ceo_photo_url": ceoPhotoUrl,
    };
}

enum Currency {
    EMPTY,
    INR
}

final currencyValues = EnumValues({
    "": Currency.EMPTY,
    "INR": Currency.INR
});

enum Emails {
    EMPTY,
    SUPPORT_WEBP_COM_AU
}

final emailsValues = EnumValues({
    "": Emails.EMPTY,
    "support@webp.com.au": Emails.SUPPORT_WEBP_COM_AU
});

enum Interval {
    EMPTY,
    MONTHLY,
    YEARLY
}

final intervalValues = EnumValues({
    "": Interval.EMPTY,
    "monthly": Interval.MONTHLY,
    "yearly": Interval.YEARLY
});

enum IsRemote {
    EMPTY,
    FALSE
}

final isRemoteValues = EnumValues({
    "": IsRemote.EMPTY,
    "False": IsRemote.FALSE
});

enum ListingType {
    EMPTY,
    ORGANIC
}

final listingTypeValues = EnumValues({
    "": ListingType.EMPTY,
    "organic": ListingType.ORGANIC
});

enum SalarySource {
    DIRECT_DATA,
    EMPTY
}

final salarySourceValues = EnumValues({
    "direct_data": SalarySource.DIRECT_DATA,
    "": SalarySource.EMPTY
});

enum Site {
    GLASSDOOR,
    LINKEDIN
}

final siteValues = EnumValues({
    "glassdoor": Site.GLASSDOOR,
    "linkedin": Site.LINKEDIN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
