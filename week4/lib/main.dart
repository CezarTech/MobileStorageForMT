import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My First Flutter App'),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[
              const SizedBox(
                height: 16.0,
              ),
              MyTextWidget(text: 'Text 1'),
              const SizedBox(
                height: 16.0,
              ),
              MyTextWidget(text: 'Text 2'),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyTextWidget(text: 'Text 3'),
                  MyTextWidget(text: 'Text 4'),
                  MyTextWidget(text: 'Text 5')
                ],
              )
            ],
          )),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  String text;
  MyTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 30.0,
        height: 50.0,
        child: Text(
          text,
          style: TextStyle(fontSize: 12, color: Colors.purple[800]),
        ));
  }
}
