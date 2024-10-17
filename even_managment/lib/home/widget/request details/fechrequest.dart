class ResourceData {
  static List<Map<String, String>> allResources = [];
  static List<Map<String, String>> myResources = [];

  static void addResource(String name, String experience, String role, String description) {
    Map<String, String> newResource = {
      "name": name,
      "experience": experience,
      "role": role,
      "description": description,
    };
    allResources.add(newResource);
  }
}
