import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import '../../../base/domain/entities/base_api_result.dart';

abstract class NumbersRepository {
  Future<BaseApiResult<NumberTrivia?>> getConcreteNumberTrivia(int number);

  Future<BaseApiResult<NumberTrivia?>> getRandomNumberTrivia();
}
