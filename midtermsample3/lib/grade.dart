import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/services.dart';

class GradeActivity extends StatefulWidget {
  const GradeActivity({super.key});

  @override
  State<GradeActivity> createState() => _GradeActivityState();
}

class _GradeActivityState extends State<GradeActivity> {
  double grade = -1;
  double grade2 = -1;
  double sum = 0;
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String;
    String url =
        'https://images.unsplash.com/photo-1567168539593-59673ababaae?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHN0dWRlbnR8ZW58MHx8MHx8fDA%3D';

    void CheckResult() {
      if (grade == -1 || grade2 == -1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all grades')),
        );
      } else {
        sum = (grade * 0.4) + (grade2 * 0.6);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$sum')),
        );
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('MidtermYearYR'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.network(
                    url,
                    width: 50,
                    height: 50,
                  ),
                  Text(name)
                ],
              ),
              SizedBox(height: 20),
              Text('Enter Grade'),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      grade = double.parse(value);
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter Midterm'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: TextField(
                  onChanged: (value2) {
                    setState(() {
                      grade2 = double.parse(value2);
                    });
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter Final'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: CheckResult, child: Text('Submit')),
            ],
          ),
        ));
  }
}
