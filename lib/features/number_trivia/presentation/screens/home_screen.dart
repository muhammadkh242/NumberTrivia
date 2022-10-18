import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:nums/common/injection_container.dart' as di;
import 'package:nums/features/base/domain/entities/base_state.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import 'package:nums/features/number_trivia/presentation/widgets/content_display.dart';
import '../view_models/number_trivia_view_model.dart';
import '../widgets/numbers_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _viewModelProvider =
      StateNotifierProvider<NumberTriviaViewModel, BaseState<NumberTrivia>>(
          (ref) {
    return NumberTriviaViewModel(ref.watch(di.getConcreteNumberProvider),
        ref.watch(di.getRandomNumberProvider));
  });

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
