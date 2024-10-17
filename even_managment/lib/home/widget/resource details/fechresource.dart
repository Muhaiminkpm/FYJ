// lib/models/resource.dart

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
}
