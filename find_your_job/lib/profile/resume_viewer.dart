import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart' as path;

class ResumeViewer extends StatelessWidget {
  final String resumePath;

  const ResumeViewer({Key? key, required this.resumePath}) : super(key: key);

  bool get isPDF => path.extension(resumePath).toLowerCase() == '.pdf';

  @override
  Widget build(BuildContext context) {
    File file = File(resumePath);

    return Scaffold(
      appBar: AppBar(
        title: Text('Resume - ${path.basename(resumePath)}'),
      ),
      body: FutureBuilder<bool>(
        future: file.exists(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.data!) {
            return Center(child: Text('File not found: $resumePath'));
          }

          return isPDF
              ? PDFView(
                  filePath: resumePath,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: true,
                  pageSnap: true,
                  onError: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $error')),
                    );
                  },
                )
              : Center(
                  child: Image.file(file),
                );
        },
      ),
    );
  }
} 