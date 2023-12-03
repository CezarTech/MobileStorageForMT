import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text='';
  double _x = -1;
  double _y = -1;

/*
 new Folder: assets
 in pub: assests: -assets/image1.jpg;
 in home: String image='assets/image1.jpg';

 List<String>images['assets/image1.jpg','assets/image2.jpg','assets/image3.jpg','assets/image4.jpg'];
 static int count =0;
 */
  void updateX(String x) {
    if (x.trim() == '') {
      _x = -1;
    } else {
      _x = double.parse(x);
    }
  }

  void updateY(String y) {
    if (y.trim() == '') {
      _y = -1;
    } else {
      _y = double.parse(y);
    }
  }

  void updateText() {
    setState(() {
      if (_x == -1 || _y == -1) {
        text = 'Please enter both X and Y coordinates to proceed!';
      } else {
        text = "Sum $_x + $_y is ${_x + _y}";
      }

      //image=images[count];
      //count = (count + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 18.0,
          ),
          Text(
            '$text',
            style: TextStyle(fontSize: 18, color: Colors.purple[800]),
          ),
          const SizedBox(
            height: 18.0,
          ),
          MyTextField(f: updateX, hint: 'Enter X'),
          const SizedBox(
            height: 18.0,
          ),
          MyTextField(f: updateY, hint: 'Enter Y'),
          const SizedBox(
            height: 18.0,
          ),
          ElevatedButton(onPressed: () => updateText(), child: const Text("Submit")),
        ]),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  Function(String) f;
  String hint;
  MyTextField({required this.f, required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50.0,
      child: TextField(
        style: const TextStyle(fontSize: 18),
        decoration:
            InputDecoration(border: const OutlineInputBorder(), hintText: hint),
        onChanged: (text) {
          f(text);
        },
       keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
