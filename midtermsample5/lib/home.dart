import 'package:flutter/material.dart';
import 'computer.dart';
import 'showimage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String totalPrice = computers.first.getTotalPrice(); // holds total car price

  Computer computer = computers.first; // set the first car to be displayed

  void updateComputer(Computer Computer) {
// updates car price when the user selects a car form the dropdown

    setState(() {
      this.computer = Computer;
    });
  }

  void updateTotalPrice() {
    setState(() {
      totalPrice = computer.getTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Price:$totalPrice '),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 20),
          Text('Select Computer'),
          SizedBox(height: 20),
          MyDropDownWidget(updateComputer: updateComputer),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Add Case:', style: TextStyle(fontSize: 18.0)),
            Checkbox(
                value: computer.addcase,
                onChanged: (bool? value) {
                  setState(() {
                    // updates the total price when the checkbox state chanes
                    computer.addcase = value as bool;
                  });
                })
          ]),
          const SizedBox(height: 20.0),
          ElevatedButton(
              onPressed: () {
                updateTotalPrice();
              },
              child: Text('Show Price')),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const showImage(),
                    settings: RouteSettings(arguments: computer.image)));
              },
              child: Text('Show Image')),
        ]),
      ),
    );
  }
}

class MyDropDownWidget extends StatefulWidget {
  final Function(Computer) updateComputer;

  const MyDropDownWidget({required this.updateComputer, super.key});

  @override
  State<MyDropDownWidget> createState() => _MyDropDownWidgetState();
}

class _MyDropDownWidgetState extends State<MyDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 210.0,
        initialSelection: computers[0], // first car to be displayed

        onSelected: (computer) {
          setState(() {
            widget.updateComputer(computer
                as Computer); // use widget to access widget fields from state class
          });
        }, // the list map function converts the list of cars to a list of DropdownMenuEntries

        dropdownMenuEntries:
            computers.map<DropdownMenuEntry<Computer>>((Computer computer) {
          return DropdownMenuEntry(value: computer, label: computer.toString());
        }).toList());
  }
}
