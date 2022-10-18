import 'package:nums/features/number_trivia/domain/repositories/numbers_repository.dart';

import '../../../base/domain/entities/base_api_result.dart';
import '../../data/models/number_trivia.dart';

class GetConcreteNumberTrivia {
  final NumbersRepository numbersRepository;

  GetConcreteNumberTrivia(this.numbersRepository);

  Future<BaseApiResult<NumberTrivia?>> call(int number) async =>
      await numbersRepository.getConcreteNumberTrivia(number);
}
