import 'package:flutter/material.dart';

class Car {
  String model;
  int price;
  int warranty = 1; // warranty years, default 1 year
  bool insurance = false; // determines if car is insured, default is false

  Car(this.model, this.price);

  String getTotalPrice() {
    int insuranceAmount = insurance ? 1000 : 0;
    if (warranty == 1) {
      return (price * 1.05 + insuranceAmount).toStringAsFixed(0);
    }
    return (price * 1.1 + insuranceAmount).toStringAsFixed(0);
  }

  @override
  String toString() {
    return '$model Price: \$$price';
  }
}

List<Car> cars = [
  Car('Honda', 10000),
  Car('Toyota', 20000),
  Car('BMW', 30000),
  Car('Hyundai', 8000)
];

class MyDropDownWidget extends StatefulWidget {
  final Function(Car) updateCar;

  const MyDropDownWidget({required this.updateCar, super.key});

  @override
  State<MyDropDownWidget> createState() => _MyDropDownWidgetState();
}

class _MyDropDownWidgetState extends State<MyDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 210.0,
        initialSelection: cars[0], // first car to be displayed

        onSelected: (car) {
          setState(() {
            widget.updateCar(car
                as Car); // use widget to access widget fields from state class
          });
        }, // the list map function converts the list of cars to a list of DropdownMenuEntries

        dropdownMenuEntries: cars.map<DropdownMenuEntry<Car>>((Car car) {
          return DropdownMenuEntry(value: car, label: car.toString());
        }).toList());
  }
}

class WarrantyWidget extends StatefulWidget {
  final Function(int) updateWarranty;
  Car car;

  WarrantyWidget({required this.updateWarranty, required this.car, Key? key})
      : super(key: key);

  @override
  State<WarrantyWidget> createState() => _WarrantyWidgetState();
}

class _WarrantyWidgetState extends State<WarrantyWidget> {
  int _years = 1; // stores warranty years and is used so that both radio buttons belong to the same group

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
          groupValue: widget.car.warranty,
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
          value: 5,
          groupValue: widget.car.warranty,
          onChanged: (val) {
            setState(() {
              _years = val as int;
              widget.updateWarranty(_years);
            });
          },
        ),
        const Text(
          '5 years',
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
