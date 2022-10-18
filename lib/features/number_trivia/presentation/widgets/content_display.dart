import 'package:flutter/material.dart';

class ContentDisplay extends StatelessWidget {
  const ContentDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: MediaQuery.of(context).size.height * 0.55,
    );
  }
}
