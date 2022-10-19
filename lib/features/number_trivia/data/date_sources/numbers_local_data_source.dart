import 'dart:convert';

import 'package:nums/features/number_trivia/data/models/number_trivia.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumbersLocalDataSource {
  SharedPreferences preferences;

  NumbersLocalDataSource(this.preferences);

  Future saveNumberTrivia(NumberTrivia numberTrivia) => preferences.setString(
      CACHED_NUMBER_TRIVIA, json.encode(numberTrivia.toJson()));

  NumberTrivia? getLastNumberTrivia() {
    final lastNumberString = preferences.getString(CACHED_NUMBER_TRIVIA);
    print(lastNumberString);
    if (lastNumberString != null) {
      return NumberTrivia.fromJson(json.decode(lastNumberString));
    } else {
      return null;
    }
  }
}
