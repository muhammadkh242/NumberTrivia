import 'package:flutter_riverpod/all.dart';
import 'package:nums/features/base/domain/entities/base_state.dart';
import 'package:nums/features/base/presentation/view_models/base_view_model.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import 'package:nums/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:nums/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class NumberTriviaViewModel extends StateNotifier<BaseState<NumberTrivia>>
    with BaseViewMModel {
  final GetConcreteNumberTrivia _getConcreteNumberTrivia;
  final GetRandomNumberTrivia _getRandomNumberTrivia;

  NumberTriviaViewModel(
      this._getConcreteNumberTrivia, this._getRandomNumberTrivia)
      : super(BaseState(data: null));

  Future<NumberTrivia?> getRandomNumberTrivia() async {
/*    state.isLoading = true;
    state = state;*/

    final result = await _getRandomNumberTrivia.call();
    if (result.data != null) {
/*      state.data = result.data;
      state.isLoading = false;
      state = state;*/
    state = state.copyWith(data: result.data);
      return result.data;
    } else if (result.errorMessage != null) {
      showSnackBar(result.errorMessage!);
    }
    return null;
  }
}
