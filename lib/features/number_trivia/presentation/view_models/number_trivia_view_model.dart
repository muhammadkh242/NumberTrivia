import 'package:flutter_riverpod/all.dart';
import 'package:nums/features/base/presentation/view_models/base_view_model.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import 'package:nums/features/number_trivia/domain/entities/number_trivia_state.dart';
import 'package:nums/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:nums/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class NumberTriviaViewModel
    extends StateNotifier<NumberTriviaState<NumberTrivia>> with BaseViewMModel {
  final GetConcreteNumberTrivia _getConcreteNumberTrivia;
  final GetRandomNumberTrivia _getRandomNumberTrivia;

  NumberTriviaViewModel(
      this._getConcreteNumberTrivia, this._getRandomNumberTrivia)
      : super(NumberTriviaState(data: null));

  getRandomNumberTrivia() async {
    state = state.copyWith(emptyNumber: false, invalidNumber: false);

    state = state.copyWith(isLoading: true);
    final result = await _getRandomNumberTrivia.call();
    if (result.data != null) {
      state = state.copyWith(data: result.data, isLoading: false);
    } else if (result.errorMessage != null) {
      showSnackBar(result.errorMessage!);
    }
  }

  getConcreteNumberTrivia(String number) async {
    if (isValidNumber(number)) {
      state = state.copyWith(isLoading: true);
      final result = await _getConcreteNumberTrivia.call(int.parse(number));
      if (result.data != null) {
        state = state.copyWith(data: result.data, isLoading: false);
      } else if (result.errorMessage != null) {
        showSnackBar(result.errorMessage!);
      }
    }
  }

  bool isValidNumber(String number) {
    state = state.copyWith(emptyNumber: false, invalidNumber: false);

    if (number.isEmpty) {
      state = state.copyWith(emptyNumber: true);
      return false;
    } else if (int.tryParse(number) == null) {
      state = state.copyWith(invalidNumber: true);

      return false;
    }
    return true;
  }
}
