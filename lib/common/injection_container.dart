import 'package:flutter_riverpod/all.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nums/common/connection/connection_info.dart';
import 'package:nums/features/number_trivia/data/date_sources/numbers_local_data_source.dart';
import 'package:nums/features/number_trivia/data/date_sources/numbers_network_data_source.dart';
import 'package:nums/features/number_trivia/data/repositories/numbers_repository_impl.dart';
import 'package:nums/features/number_trivia/domain/repositories/numbers_repository.dart';
import 'package:nums/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:nums/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  print("sharedPreferencesProvider");
  throw UnimplementedError();
});

final numbersNetworkDataSourceProvider =
    Provider<NumbersNetworkDataSource>((ref) {
  print("numbersNetworkDataSourceProvider");
  return NumbersNetworkDataSource();
});

final numbersLocalDataSourceProvider = Provider((ref) {
  print("numbersLocalDataSourceProvider");
  return NumbersLocalDataSource(ref.read(sharedPreferencesProvider));
});

final connectionCheckerProvider = Provider((ref) {
  print("connectionCheckerProvider");
  return InternetConnectionChecker();
});

final connectionInfoProvider = Provider<ConnectionInfo>((ref) {
  print("connectionInfoProvider");
  return ConnectionInfo(ref.read(connectionCheckerProvider));
});

final numbersRepositoryProvider = Provider<NumbersRepository>((ref) {
  print("numbersRepositoryProvider");
  final numbersNetworkDataSource = ref.read(numbersNetworkDataSourceProvider);
  final numbersLocalDataSource = ref.read(numbersLocalDataSourceProvider);
  final connectionInfo = ref.read(connectionInfoProvider);
  return NumbersRepositoryImpl(
      numbersNetworkDataSource, numbersLocalDataSource, connectionInfo);
});

final getConcreteNumberProvider = Provider<GetConcreteNumberTrivia>((ref) {
  print("getConcreteNumberProvider");
  return GetConcreteNumberTrivia(ref.read(numbersRepositoryProvider));
});

final getRandomNumberProvider = Provider<GetRandomNumberTrivia>((ref) {
  print("getRandomNumberProvider");
  return GetRandomNumberTrivia(ref.read(numbersRepositoryProvider));
});
