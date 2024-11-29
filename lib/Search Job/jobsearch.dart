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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData ||
                      snapshot.data!.results.isEmpty) {
                    return const Center(
                      child: Text('No job categories found'),
                    );
                  }
                  return Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data!.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(snapshot.data!.results[index].label);
                      // return new Card(
                      //   child: new GridTile(
                          
                      //     child:  new Text(snapshot.data!.results.first.label), //just for testing, will fill with image later
                      //   ),
                      // );
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
