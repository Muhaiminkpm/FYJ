// file: resource.dart

class Resource {
  String name;
  String experience;
  String technology;
  String phone;
  String? resumePath;

  Resource({
    required this.name,
    required this.experience,
    required this.technology,
    required this.phone,
    this.resumePath,
  });

  // Convert a Resource to a Map (for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'experience': experience,
      'technology': technology,
      'phone': phone,
      'resumePath': resumePath,
    };
  }

  // Convert a Map (from JSON) to a Resource
  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      name: json['name'],
      experience: json['experience'],
      technology: json['technology'],
      phone: json['phone'],
      resumePath: json['resumePath'],
    );
  }
}
