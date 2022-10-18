import 'package:nums/features/base/domain/entities/base_api_result.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import 'package:nums/features/number_trivia/domain/repositories/numbers_repository.dart';

class GetRandomNumberTrivia {
  final NumbersRepository numbersRepository;

  GetRandomNumberTrivia(this.numbersRepository);

  Future<BaseApiResult<NumberTrivia?>> call() async =>
      await numbersRepository.getRandomNumberTrivia();
}
