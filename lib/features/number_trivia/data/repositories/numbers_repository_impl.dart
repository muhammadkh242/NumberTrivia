import 'dart:ui';

import 'package:nums/features/base/domain/entities/base_api_result.dart';
import 'package:nums/features/number_trivia/data/date_sources/numbers_local_data_source.dart';
import 'package:nums/features/number_trivia/data/date_sources/numbers_network_data_source.dart';
import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import 'package:nums/features/number_trivia/domain/repositories/numbers_repository.dart';

import '../../../../common/connection/connection_info.dart';

class NumbersRepositoryImpl implements NumbersRepository {
  NumbersNetworkDataSource numbersNetworkDataSource;
  NumbersLocalDataSource numbersLocalDataSource;
  ConnectionInfo connectionInfo;

  NumbersRepositoryImpl(
    this.numbersNetworkDataSource,
    this.numbersLocalDataSource,
    this.connectionInfo,
  );

  @override
  Future<BaseApiResult<NumberTrivia?>> getConcreteNumberTrivia(
      int number) async {
    return await _getNumberTrivia(() async {
      return await numbersNetworkDataSource.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<BaseApiResult<NumberTrivia?>> getRandomNumberTrivia() async {
    return await _getNumberTrivia(() async {
      return await numbersNetworkDataSource.getRandomNumberTrivia();
    });
  }

  Future<BaseApiResult<NumberTrivia?>> _getNumberTrivia(
      Function getNumberTrivia) async {
    if (await connectionInfo.isConnected) {
      final numberFromNetwork = await getNumberTrivia();
      numbersLocalDataSource.saveNumberTrivia(numberFromNetwork);
      return numberFromNetwork;
    } else {
      final numberFromLocal = numbersLocalDataSource.getLastNumberTrivia();
      return BaseApiResult(data: numberFromLocal);
    }
  }
}
