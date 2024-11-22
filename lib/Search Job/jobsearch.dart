import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobSearch extends StatefulWidget {
  const JobSearch({super.key});

  @override
  State<JobSearch> createState() => _JobSearch();
}

class _JobSearch extends State<JobSearch> {
  List<String> itemJobs = [
    'Design',
    'Finance',
    'Education',
    'Restaurent',
    'Health',
    'Programmer'
  ];
  List<IconData> itemIcon = [
    Icons.movie,
    Icons.card_membership,
    Icons.school,
    Icons.storefront,
    Icons.spa,
    Icons.terminal
  ];
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
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: itemJobs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Icon(itemIcon[index]),
                        ),
                        SizedBox(height: 10),
                        Text(itemJobs[index])
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
