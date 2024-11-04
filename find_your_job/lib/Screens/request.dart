// File: request_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../request details/addrequest.dart';
import '../request details/details.dart';
import '../request details/fechrequest.dart';
import '../Api/api.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  bool showMyRequest = false;
  bool isLoading = true;
  List<Job> jobs = [];

  @override
  void initState() {
    super.initState();
    _loadRequestData();
  }

  Future<void> _loadRequestData() async {
    setState(() {
      isLoading = true;
    });
    
    try {
      final fetchedJobs = await RequestData.fetchRequestsFromApi();
      setState(() {
        jobs = fetchedJobs;
        isLoading = false;
      });
      print('Fetched ${jobs.length} jobs');
    } catch (e) {
      print("Error loading data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showMyRequest = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'All Jobs',
                        style: GoogleFonts.ubuntu(
                          color: !showMyRequest ? Colors.blue : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      if (!showMyRequest)
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          height: 2,
                          width: 150,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showMyRequest = true;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Saved Jobs',
                        style: GoogleFonts.ubuntu(
                          color: showMyRequest ? Colors.blue : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      if (showMyRequest)
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          height: 2,
                          width: 150,
                          color: Colors.blue,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : jobs.isEmpty
                    ? const Center(
                        child: Text(
                          'No jobs available',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: _loadRequestData,
                        child: ListView.builder(
                          itemCount: showMyRequest
                              ? RequestData.myRequest.length
                              : jobs.length,
                          itemBuilder: (context, index) {
                            final job = showMyRequest
                                ? RequestData.myRequest[index]
                                : RequestData.fromJob(jobs[index]);

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailEmploye(
                                      resource: job.toMap(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            job.title,
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            RequestData.isInMyRequest(job)
                                                ? Icons.bookmark
                                                : Icons.bookmark_border,
                                            color: Colors.blue,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (RequestData.isInMyRequest(job)) {
                                                RequestData.removeFromMyRequest(job);
                                              } else {
                                                RequestData.addToMyRequest(job);
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      job.company,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,
                                            size: 16, color: Colors.grey[600]),
                                        const SizedBox(width: 4),
                                        Text(
                                          job.location,
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      job.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Posted: ${job.datePosted}',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRequest()),
          ).then((_) => _loadRequestData());
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
