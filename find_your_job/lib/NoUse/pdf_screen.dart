import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class FileViewerScreen extends StatelessWidget {
  final String filePath;

  const FileViewerScreen({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    bool isPdf = filePath.toLowerCase().endsWith('.pdf');
    File file = File(filePath);

    return Scaffold(
      appBar: AppBar(
        title: Text(isPdf ? 'PDF Viewer' : 'Image Viewer'),
      ),
      body: FutureBuilder<bool>(
        future: file.exists(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.data!) {
            return Center(child: Text('File not found: $filePath'));
          }

          return isPdf
              ? PDFView(filePath: filePath)
              : Center(
                  child: Image.file(file),
                );
        },
      ),
    );
  }
}
