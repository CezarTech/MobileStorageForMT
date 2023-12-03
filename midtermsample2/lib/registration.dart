import 'package:flutter/material.dart';
import 'home.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    final info = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Back'),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Congrats, you have benn register'),
          SizedBox(
            height: 20,
          ),
          Text('$info', style: TextStyle(fontSize: 35)),
        ]),
      ),
    );
  }
}
