import 'package:find_your_job/Api/job_api.dart';
import 'package:find_your_job/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobSearch extends StatefulWidget {
  const JobSearch({super.key});

  @override
  State<JobSearch> createState() => _JobSearch();
}

class _JobSearch extends State<JobSearch> {
  late Future<JobCategoriesResponse> futureJob;

  @override
  void initState() {
    super.initState();
    futureJob = fetchJob();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
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
              ),
              SizedBox(height: 10),
              Text(
                'Specialization',
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              FutureBuilder<JobCategoriesResponse>(
                future: futureJob,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.results.toString());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
