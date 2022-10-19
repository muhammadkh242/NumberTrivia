import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:nums/common/injection_container.dart' as di;
import 'package:nums/features/base/domain/entities/base_state.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import 'package:nums/features/number_trivia/domain/entities/number_trivia_state.dart';
import 'package:nums/features/number_trivia/presentation/widgets/content_display.dart';
import 'package:nums/features/number_trivia/presentation/widgets/validation_error.dart';
import '../view_models/number_trivia_view_model.dart';
import '../widgets/numbers_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _viewModelProvider = StateNotifierProvider<NumberTriviaViewModel,
      NumberTriviaState<NumberTrivia>>((ref) {
    return NumberTriviaViewModel(ref.watch(di.getConcreteNumberProvider),
        ref.watch(di.getRandomNumberProvider));
  });

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: ContentDisplay(
                  viewModelProvider: _viewModelProvider,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (BuildContext context,
                    T Function<T>(ProviderBase<Object?, T>) watch,
                    Widget? child) {
                  final emptyNumber = watch(_viewModelProvider).emptyNumber;
                  final invalidNumber = watch(_viewModelProvider).invalidNumber;
                  return emptyNumber || invalidNumber
                      ? ValidationError(
                          text: emptyNumber
                              ? "Please enter a number"
                              : "Please enter a valid number")
                      : Container();
                },
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Expanded(
                      child: NumbersButton(
                    text: "Search",
                    onTap: () {
                      context
                          .read(_viewModelProvider.notifier)
                          .getConcreteNumberTrivia(
                              textEditingController.text.trim());
                    },
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: NumbersButton(
                    text: "Random",
                    onTap: () {
                      context
                          .read(_viewModelProvider.notifier)
                          .getRandomNumberTrivia();
                      textEditingController.clear();
                    },
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
