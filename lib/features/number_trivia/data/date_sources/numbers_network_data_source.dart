import 'package:nums/common/api/api_methods.dart';
import 'package:nums/common/api/api_urls.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';

import '../../../base/domain/entities/base_api_result.dart';

class NumbersNetworkDataSource {
  Future<BaseApiResult<NumberTrivia>> getConcreteNumberTrivia(
          int number) async =>
      await ApiMethods<NumberTrivia>().get(ApiUrls.BASE_URL, null);

  Future<BaseApiResult<NumberTrivia>> getRandomNumberTrivia() async =>
      await ApiMethods<NumberTrivia>().get(ApiUrls.RANDOM_NUM_URL, null);
}
