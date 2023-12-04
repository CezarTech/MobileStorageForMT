import 'package:flutter/material.dart';

class showImage extends StatelessWidget {
  const showImage({super.key});

  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context)!.settings.arguments as String;

    return Image.network(url, width: 600, height: 300, fit: BoxFit.fill); ;
  }
}
