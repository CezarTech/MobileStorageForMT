import 'package:flutter/material.dart';

class Item {
  String name;
  double price;
  String image;
  bool selected = false;

  Item(this.name, this.price, this.image);

  @override
  String toString() {
    return 'Price:\$ $price $name';
  }
}

List<Item> items = [
  Item('Burgur', 7,
      'https://images.unsplash.com/photo-1675257163553-7b47b4680636?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ3VyfGVufDB8fDB8fHww'),
  Item('Pizza', 10,
      'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cGl6emF8ZW58MHx8MHx8fDA%3D'),
  Item('Salad', 6,
      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8U2FsYWR8ZW58MHx8MHx8fDA%3D'),
  Item('Fresh Juice', 4,
      'https://images.unsplash.com/photo-1613478223719-2ab802602423?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZnJlc2glMjBqdWljZXxlbnwwfHwwfHx8MA%3D%3D'),
];

// holds selected item
List<Item> selectedItems = [];

void reset() {
  // el selected la nseweya unselected
  for (var e in items) {
    e.selected = false;
  }
  selectedItems.clear();
}

class ShowMenu extends StatelessWidget {
  final Function(double) update;

  const ShowMenu({required this.update, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 1.3;
    }
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: screenWidth * 0.25),
                  Checkbox(
                    value: items[index].selected,
                    onChanged: (e) {
                      double p = items[index].price;
                      if (!(e as bool)) {
                        // type casting  in java (bool)e
                        selectedItems.remove(items[index]);
                        p = p * -1;
                      } else {
                        selectedItems.add(items[index]);
                      }
                      items[index].selected = e;
                      update(p);
                    },
                  ),
                  Text(items[index].toString(),
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Image.network(
                items[index].image,
                width: 180,
                height: 150,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 5),
            ],
          );
        });
  }
}

class ShowSlectedItems extends StatelessWidget {
  const ShowSlectedItems({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 1.3;
    }

    return ListView.builder(
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          return Column(children: [
            const SizedBox(height: 5),
            Text(selectedItems[index].toString(),
                style: const TextStyle(fontSize: 18)),
            Image.network(
              selectedItems[index].image,
              width: 180,
              height: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 5),
          ]);
        }); // bet3yt la kill item w la kill item btb3tli index starting from 0 (context,index)
  }
}
