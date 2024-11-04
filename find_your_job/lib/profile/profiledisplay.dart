// lib/screens/profile_display.dart

import 'package:flutter/material.dart';
import 'modelprofile.dart';
import 'profile.dart';
import 'sharedpreference.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'resume_viewer.dart';

class ProfileDisplay extends StatefulWidget {
  const ProfileDisplay({Key? key}) : super(key: key);

  @override
  State<ProfileDisplay> createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  ProfileModel? _profile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await SharedPreferencesHelper.getProfile();
    setState(() {
      _profile = profile;
    });
  }

  Future<bool> _checkResumeExists() async {
    if (_profile?.resumePath == null) return false;
    final file = File(_profile!.resumePath!);
    return await file.exists();
  }

  @override
  Widget build(BuildContext context) {
    if (_profile == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Display'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProfile()),
              );
              _loadProfile(); // Reload profile after returning from edit screen
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadProfile,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _profile!.imagePath != null
                          ? FileImage(File(_profile!.imagePath!))
                          : null,
                      onBackgroundImageError: _profile!.imagePath != null
                          ? (exception, stackTrace) {
                              print('Error loading image: $exception');
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Failed to load profile image'),
                                  ),
                                );
                              }
                            }
                          : null,
                      child: _profile!.imagePath == null
                          ? const Icon(Icons.person, size: 50)
                          : null,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _profile!.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      _profile!.email,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Location
              Card(
                child: ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Location'),
                  subtitle: Text(_profile!.location),
                ),
              ),
              const SizedBox(height: 16),

              // Bio
              if (_profile!.bio.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About Me',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        Text(_profile!.bio),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 16),

              // Skills
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Skills',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: _profile!.skills.map((skill) {
                          return Chip(
                            label: Text(skill),
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),

              // Work Experience Section
              if (_profile!.experience.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Work Experience',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _profile!.experience.length,
                          itemBuilder: (context, index) {
                            final exp = _profile!.experience[index];
                            return ListTile(
                              title: Text(exp.position),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(exp.company),
                                  Text('${exp.startDate} - ${exp.endDate}'),
                                  Text(exp.description),
                                ],
                              ),
                              isThreeLine: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 16),

              // Education Section
              if (_profile!.education.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Education',
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _profile!.education.length,
                          itemBuilder: (context, index) {
                            final edu = _profile!.education[index];
                            return ListTile(
                              title: Text(edu.degree),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(edu.institution),
                                  Text('Graduated: ${edu.graduationYear}'),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

              // Resume
              if (_profile!.resumePath != null)
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.description),
                    title: const Text('Resume'),
                    subtitle: Text(path.basename(_profile!.resumePath!)),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResumeViewer(
                            resumePath: _profile!.resumePath!,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
