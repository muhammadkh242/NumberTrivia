import 'package:flutter_riverpod/all.dart';
import 'package:nums/features/base/domain/entities/base_state.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import 'package:nums/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:nums/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

class NumberTriviaViewModel extends StateNotifier<BaseState<NumberTrivia>> {
  final GetConcreteNumberTrivia _getConcreteNumberTrivia;
  final GetRandomNumberTrivia _getRandomNumberTrivia;

  NumberTriviaViewModel(
      this._getConcreteNumberTrivia, this._getRandomNumberTrivia)
      : super(BaseState(data: null));


}
