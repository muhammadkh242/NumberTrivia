import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:nums/features/number_trivia/presentation/widgets/number_info.dart';
import '../../../base/domain/entities/base_state.dart';
import '../../data/models/number_trivia.dart';
import '../view_models/number_trivia_view_model.dart';

class ContentDisplay extends StatelessWidget {
  const ContentDisplay({Key? key, required this.viewModelProvider})
      : super(key: key);
  final StateNotifierProvider<NumberTriviaViewModel, BaseState<NumberTrivia>>
      viewModelProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Center(
        child: Consumer(
          builder: (BuildContext context,
              T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
            final state = watch(viewModelProvider);

            return state.isLoading
                ? const CircularProgressIndicator()
                : state.data != null
                    ? NumberInfo(numberTrivia: state.data!)
                    : const Text(
                        "Search a Number",
                        style: TextStyle(fontSize: 20),
                      );
          },
        ),
      ),
    );
  }
}
