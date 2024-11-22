import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'model_profile.dart';
import '../SharedPreferences/sharedpreference.dart';
import 'profile_display.dart';
import 'resume_pick.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  XFile? _imageFile;
  // ignore: unused_field
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  // Add controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  final _bioController = TextEditingController();
  List<String> _skills = ['Flutter', 'Dart'];
  String? _resumePath;

  // Add these lists to store experience and education
  List<WorkExperience> _experience = [];
  List<Education> _education = [];

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await SharedPreferencesHelper.getProfile();
    if (profile != null) {
      setState(() {
        _nameController.text = profile.name;
        _emailController.text = profile.email;
        _locationController.text = profile.location;
        _bioController.text = profile.bio;
        _skills = profile.skills;
        _resumePath = profile.resumePath;
        _experience = profile.experience;
        _education = profile.education;
        // Load existing image if available
        if (profile.imagePath != null) {
          _imageFile = XFile(profile.imagePath!);
        }
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      final profile = ProfileModel(
        name: _nameController.text,
        email: _emailController.text,
        location: _locationController.text,
        experience: _experience,
        education: _education,
        skills: _skills,
        resumePath: _resumePath,
        bio: _bioController.text,
        imagePath: _imageFile?.path,
      );

      await SharedPreferencesHelper.saveProfile(profile);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile saved successfully')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileDisplay()),
        );
      }
    }
  }

  // Add this method to handle adding work experience
  void _addWorkExperience(WorkExperience experience) {
    setState(() {
      _experience.add(experience);
    });
  }

  // Add this method to handle adding education
  void _addEducation(Education education) {
    setState(() {
      _education.add(education);
    });
  }

  // Add these methods to validate the forms
  bool _validateWorkExperience(String company, String position) {
    if (company.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter company name')),
      );
      return false;
    }
    if (position.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter position')),
      );
      return false;
    }
    return true;
  }

  bool _validateEducation(
      String institution, String degree, String graduationYear) {
    if (institution.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter institution name')),
      );
      return false;
    }
    if (degree.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter degree')),
      );
      return false;
    }
    if (graduationYear.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter graduation year')),
      );
      return false;
    }
    return true;
  }

  // In the build method, wrap the Column with Form
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Section
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: _imageFile != null
                          ? FileImage(File(_imageFile!.path))
                          : null,
                      backgroundColor: Colors.grey[300],
                      radius: 60,
                      child: _imageFile == null
                          ? const Icon(Icons.person,
                              size: 60, color: Colors.grey)
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon:
                              const Icon(Icons.camera_alt, color: Colors.white),
                          onPressed: () async {
                            final ImagePicker picker = ImagePicker();
                            try {
                              final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery,
                                maxWidth: 1800,
                                maxHeight: 1800,
                                imageQuality: 85,
                              );
                              if (image != null) {
                                setState(() {
                                  _imageFile = image;
                                });
                              }
                            } catch (e) {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Failed to pick image')),
                                );
                              }
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Basic Information Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Basic Information',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _locationController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your location';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Location',
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Work Experience Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Work Experience',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),
                      ListTile(
                        title: const Text('Add Work Experience'),
                        trailing: const Icon(Icons.add),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              String company = '';
                              String position = '';
                              String startDate = '';
                              String endDate = '';
                              String description = '';

                              return AlertDialog(
                                title: const Text('Add Work Experience'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        onChanged: (value) => company = value,
                                        decoration: const InputDecoration(
                                            labelText: 'Company'),
                                      ),
                                      TextField(
                                        onChanged: (value) => position = value,
                                        decoration: const InputDecoration(
                                            labelText: 'Position'),
                                      ),
                                      TextField(
                                        onChanged: (value) => startDate = value,
                                        decoration: const InputDecoration(
                                            labelText: 'Start Date'),
                                      ),
                                      TextField(
                                        onChanged: (value) => endDate = value,
                                        decoration: const InputDecoration(
                                            labelText: 'End Date'),
                                      ),
                                      TextField(
                                        onChanged: (value) =>
                                            description = value,
                                        maxLines: 3,
                                        decoration: const InputDecoration(
                                            labelText: 'Description'),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (_validateWorkExperience(
                                          company, position)) {
                                        _addWorkExperience(WorkExperience(
                                          company: company,
                                          position: position,
                                          startDate: startDate,
                                          endDate: endDate,
                                          description: description,
                                        ));
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Add'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      if (_experience.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _experience.length,
                          itemBuilder: (context, index) {
                            final exp = _experience[index];
                            return ListTile(
                              title: Text(exp.position),
                              subtitle: Text(exp.company),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _experience.removeAt(index);
                                  });
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Education Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Education',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),
                      ListTile(
                        title: const Text('Add Education'),
                        trailing: const Icon(Icons.add),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              String institution = '';
                              String degree = '';
                              String graduationYear = '';

                              return AlertDialog(
                                title: const Text('Add Education'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      onChanged: (value) {
                                        institution = value;
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Institution',
                                        hintText: 'Enter institution name',
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (value) {
                                        degree = value;
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Degree',
                                        hintText: 'Enter degree/certification',
                                      ),
                                    ),
                                    TextField(
                                      onChanged: (value) {
                                        graduationYear = value;
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Graduation Year',
                                        hintText: 'Enter graduation year',
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (_validateEducation(institution,
                                          degree, graduationYear)) {
                                        _addEducation(Education(
                                          institution: institution,
                                          degree: degree,
                                          graduationYear: graduationYear,
                                        ));
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Add'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      if (_education.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _education.length,
                          itemBuilder: (context, index) {
                            final edu = _education[index];
                            return ListTile(
                              title: Text(edu.degree),
                              subtitle: Text(edu.institution),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _education.removeAt(index);
                                  });
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Skills Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Skills',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8.0,
                        children: [
                          ..._skills.map((skill) => Chip(
                                label: Text(skill),
                                onDeleted: () {
                                  setState(() {
                                    _skills.remove(skill);
                                  });
                                },
                              )),
                          ActionChip(
                            label: const Text('Add Skill'),
                            onPressed: () {
                              _showAddSkillDialog();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Resume Upload Section
              ResumePicker(
                onFilePicked: (String path) {
                  setState(() {
                    _resumePath = path;
                  });
                },
              ),

              // Bio Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Professional Summary',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _bioController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Write a brief professional summary...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Save Profile'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddSkillDialog() {
    String newSkill = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Skill'),
          content: TextField(
            onChanged: (value) {
              newSkill = value;
            },
            decoration: const InputDecoration(
              hintText: 'Enter skill name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newSkill.isNotEmpty) {
                  setState(() {
                    _skills.add(newSkill);
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    super.dispose();
  }
}
