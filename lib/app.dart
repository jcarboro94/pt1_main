import 'package:flutter/material.dart';

import 'features/counter/presentation/counter_view.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ButtonStyle customButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) return Colors.deepPurple;
        return Colors.deepPurple;
      },
    ),
    foregroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) return Colors.white;
        return Colors.white;
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: customButtonStyle,
        ),
        textButtonTheme: TextButtonThemeData(
          style: customButtonStyle,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: customButtonStyle,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const CounterView(),
    );
  }
}
