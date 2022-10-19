import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:nums/features/number_trivia/presentation/screens/home_screen.dart';
import 'package:nums/common/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    overrides: [
      di.sharedPreferencesProvider
          .overrideWithValue(await SharedPreferences.getInstance()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
