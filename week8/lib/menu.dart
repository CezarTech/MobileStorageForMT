import 'package:flutter/material.dart';
import 'item.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  double _sum = 0;
  bool _selected = false;

  void updateTotalPrice(double price) {
    setState(() {
      _sum += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  reset();
                  _sum = 0; // reset la sum
                  _selected = false;
                });
              },
              icon: const Icon(Icons.restore)),
          IconButton(
              onPressed: () {
                setState(() {
                  if (_sum != 0) {
                    _selected = !_selected;
                  }
                });
              },
              icon: const Icon(Icons.shopping_bag_outlined))
        ],
        title: Text('Total price:\$ $_sum'),
        centerTitle: true,
      ),
      body: !_selected
          ? ShowMenu(
              update: updateTotalPrice,
            )
          : const ShowSlectedItems(),
    );
    ;
  }
}
