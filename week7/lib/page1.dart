import 'package:flutter/material.dart';
import 'page2.dart';
import 'employee.dart';
import 'package:flutter/services.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _controllerHours = TextEditingController();
  final TextEditingController _controllerRate = TextEditingController();

  @override
  void dispose() {
    _controllerRate.dispose();
    _controllerHours.dispose();
    super.dispose();
  }

  void openPage2() {
    try {
      int hours = int.parse(_controllerHours.text);
      double rate = double.parse(_controllerRate.text);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Page2(),
          settings: RouteSettings(arguments: Employee(hours, rate))));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Wrong Arguments')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hello Page 1'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                controller: _controllerHours,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter houres'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                controller: _controllerRate,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter rate'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  openPage2();
                },
                child: const Icon(Icons.navigate_next, size: 50))
          ]),
        ));
  }
}
