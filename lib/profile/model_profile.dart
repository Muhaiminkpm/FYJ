// lib/models/profile_model.dart
class ProfileModel {
  final String name;
  final String email;
  final String location;
  final List<WorkExperience> experience;
  final List<Education> education;
  final List<String> skills;
  final String? resumePath;
  final String bio;
  final String? imagePath;

  ProfileModel({
    required this.name,
    required this.email,
    required this.location,
    required this.experience,
    required this.education,
    required this.skills,
    this.resumePath,
    required this.bio,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'experience': experience.map((e) => e.toMap()).toList(),
      'education': education.map((e) => e.toMap()).toList(),
      'skills': skills,
      'resumePath': resumePath,
      'bio': bio,
      'imagePath': imagePath,
    };
  }

  static ProfileModel fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      location: map['location'] ?? '',
      experience: ((map['experience'] as List?) ?? [])
          .map((e) => WorkExperience.fromMap(e))
          .toList(),
      education: ((map['education'] as List?) ?? [])
          .map((e) => Education.fromMap(e))
          .toList(),
      skills: List<String>.from(map['skills'] ?? []),
      resumePath: map['resumePath'],
      bio: map['bio'] ?? '',
      imagePath: map['imagePath'],
    );
  }
}

class WorkExperience {
  final String company;
  final String position;
  final String startDate;
  final String endDate;
  final String description;

  WorkExperience({
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'company': company,
      'position': position,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
    };
  }

  static WorkExperience fromMap(Map<String, dynamic> map) {
    return WorkExperience(
      company: map['company'],
      position: map['position'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      description: map['description'],
    );
  }
}

class Education {
  final String institution;
  final String degree;
  final String graduationYear;

  Education({
    required this.institution,
    required this.degree,
    required this.graduationYear,
  });

  Map<String, dynamic> toMap() {
    return {
      'institution': institution,
      'degree': degree,
      'graduationYear': graduationYear,
    };
  }

  static Education fromMap(Map<String, dynamic> map) {
    return Education(
      institution: map['institution'],
      degree: map['degree'],
      graduationYear: map['graduationYear'],
    );
  }
}
