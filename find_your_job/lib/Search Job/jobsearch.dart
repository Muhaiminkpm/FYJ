import 'package:flutter/material.dart';

class JobSearch extends StatefulWidget {
  const JobSearch({super.key});

  @override
  State<JobSearch> createState() => _JobSearch();
}

class _JobSearch extends State<JobSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Job title, keyword, or company'),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Search...',
              ),
            )
          ],
        ),
      ),
    );
  }
}
