import 'package:flutter/material.dart';

class ValidationError extends StatelessWidget {
  const ValidationError({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      decoration: BoxDecoration(color: Colors.red[300]),
      child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 14),)),
    );
  }
}
