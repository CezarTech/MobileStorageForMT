import 'package:flutter/material.dart';
import 'course.dart';
import 'registration.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Sample URL, replace it with your actual image URL
  String url =
      'data:image/png;base64,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';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fall 2023-Registration'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.network(
              url,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text('Select the course you want'),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Registration(),
                              settings: RouteSettings(
                                arguments: courses[index].getInfo(),
                              ),
                            ),
                          );
                        },
                        child: Text(courses[index].toString()),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
