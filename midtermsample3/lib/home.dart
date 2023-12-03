import 'package:flutter/material.dart';
import 'student.dart';
import 'grade.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MidtermExamYR'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text('Select a student to enter his grade'),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const GradeActivity(),
                                      settings: RouteSettings(
                                          arguments:
                                              students[index].getName())));
                                },
                                child: Text(
                                  students[index].toString(),
                                  style: TextStyle(
                                      fontSize: 23, color: Colors.purple[800]),
                                ))
                          ],
                        );
                      }))
            ],
          ),
        ));
  }
}
