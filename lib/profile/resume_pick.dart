// lib/screens/resume_picker.dart
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ResumePicker extends StatelessWidget {
  final Function(String) onFilePicked;

  const ResumePicker({super.key, required this.onFilePicked});

  Future<void> _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      onFilePicked(result.files.single.path!);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('No file selected')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Upload Resume (PDF)'),
      trailing: const Icon(Icons.upload_file),
      onTap: () => _pickFile(context),
    );
  }
}
