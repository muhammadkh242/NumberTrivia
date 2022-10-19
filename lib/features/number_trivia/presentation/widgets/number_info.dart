import 'package:flutter/material.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';

class NumberInfo extends StatelessWidget {
  const NumberInfo({Key? key, required this.numberTrivia}) : super(key: key);
  final NumberTrivia numberTrivia;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            numberTrivia.number.toString(),
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          numberTrivia.text,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
