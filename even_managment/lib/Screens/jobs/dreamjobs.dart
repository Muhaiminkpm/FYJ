import 'package:even_managment/Screens/jobs/success.dart';
import 'package:flutter/material.dart';

class DreamJob extends StatefulWidget {
  const DreamJob({super.key});

  @override
  State<DreamJob> createState() => _DreamJobState();
}

class _DreamJobState extends State<DreamJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'asstes/Screenshot_2024-10-08_011447-removebg-preview.png',
              color: const Color.fromARGB(211, 244, 241, 241),
              width: 400,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 150,
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tob Search for',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const Row(
                      children: [
                        Text(
                          'Dream Job',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.work,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    const Text(
                        '''Loren ipsum is simply dummy text of the printing 
and typesetting industry'''),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              backgroundColor: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SuccesPage()));
                          },
                          child: const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
