import 'package:flutter/material.dart';
import 'car.dart';
import 'image.dart';

class ListCars extends StatefulWidget {
  const ListCars({super.key});

  @override
  State<ListCars> createState() => _ListCarsState();
}

class _ListCarsState extends State<ListCars> {
  String text = 'Available Cars';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 1.3;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ShowImage(),
                                  settings: RouteSettings(
                                      arguments: cars[index].image)));
                            },
                            child: Icon(
                              Icons.search,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 5),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                text =
                                    '${cars[index].model} Price:${cars[index].rentPerday}';
                              });
                            },
                            child: Icon(
                              Icons.menu,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(cars[index].toString())
                        ])
                  ],
                );
              })),
    );
  }
}
