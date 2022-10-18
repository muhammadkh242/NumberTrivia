import 'package:flutter/material.dart';
import 'package:nums/features/number_trivia/presentation/widgets/content_display.dart';

import '../widgets/numbers_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const ContentDisplay(),
            const SizedBox(
              height: 30,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(
                    child: NumbersButton(
                  text: "Search",
                  onTap: () {},
                )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: NumbersButton(
                  text: "Random",
                  onTap: () {},
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
