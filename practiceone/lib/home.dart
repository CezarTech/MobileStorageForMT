import 'package:flutter/material.dart';
import 'package:practiceone/showimage.dart';
import 'phone.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double price = phones.first.price;
  Phone phone = phones.first;

  void updatephone(Phone) {
    setState(() {
      this.phone = Phone;
    });
  }

  void updateWarranty(int warranty) {
    setState(() {
      phone.warrenty = warranty;
    });
  }

  void showprice() {
    setState(() {
      int protection = phone.protectionscreen ? 10 : 0;

      if (phone.warrenty == 1) {
        price = (phone.price + protection) * 2;
      } else {
        price = (phone.price + protection) * 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Price:$price'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 20),
          Text('Select Phone'),
          MyDropDownWidget(updatephone: updatephone),
          SizedBox(height: 30),
          WarrantyWidget(updateWarranty: updateWarranty, phone: phone),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Screen Protection', style: TextStyle(fontSize: 18.0)),
            Checkbox(
                value: phone.protectionscreen,
                onChanged: (bool? value) {
                  setState(() {
                    // updates the total price when the checkbox state chanes

                    phone.protectionscreen = value as bool;
                  });
                })
          ]),
          const SizedBox(height: 10.0),
          ElevatedButton(
              onPressed: () {
                showprice();
              },
              child: Text('Show Price')),
          const SizedBox(height: 10.0),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ShowImage(),
                    settings: RouteSettings(arguments: phone.image)));
              },
              child: Text('Show Image')),
        ]),
      ),
    );
  }
}

class MyDropDownWidget extends StatefulWidget {
  final Function(Phone) updatephone;

  const MyDropDownWidget({required this.updatephone, super.key});

  @override
  State<MyDropDownWidget> createState() => _MyDropDownWidgetState();
}

class _MyDropDownWidgetState extends State<MyDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 210.0,
        initialSelection: phones[0], // first car to be displayed

        onSelected: (phone) {
          setState(() {
            widget.updatephone(phone
                as Phone); // use widget to access widget fields from state class
          });
        }, // the list map function converts the list of cars to a list of DropdownMenuEntries

        dropdownMenuEntries:
            phones.map<DropdownMenuEntry<Phone>>((Phone phone) {
          return DropdownMenuEntry(value: phone, label: phone.toString());
        }).toList());
  }
}

class WarrantyWidget extends StatefulWidget {
  final Function(int) updateWarranty;
  Phone phone;

  WarrantyWidget({required this.updateWarranty, required this.phone, Key? key})
      : super(key: key);

  @override
  State<WarrantyWidget> createState() => _WarrantyWidgetState();
}

class _WarrantyWidgetState extends State<WarrantyWidget> {
  int _years =
      1; // stores warranty years and is used so that both radio buttons belong to the same group

  @override
  Widget build(BuildContext context) {
    // Add the radio group to a row widget to arrange them horizontally
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Warranty',
          style: TextStyle(fontSize: 18.0),
        ),
        Radio(
          value: 1,
          groupValue: widget.phone.warrenty,
          onChanged: (val) {
            setState(() {
              _years = val as int;
              widget.updateWarranty(_years);
            });
          },
        ),
        const Text(
          '1 year',
          style: TextStyle(fontSize: 18.0),
        ),
        Radio(
          value: 2,
          groupValue: widget.phone.warrenty,
          onChanged: (val) {
            setState(() {
              _years = val as int;
              widget.updateWarranty(_years);
            });
          },
        ),
        const Text(
          '2 years',
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
