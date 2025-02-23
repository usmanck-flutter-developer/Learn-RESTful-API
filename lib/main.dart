import 'package:api_learning_by_doing/post_api5/post_api_example1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // You May Change the ThemeData as per your Requirements
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold))),

      // Below
      // Call here all API Examples 1 by 1
      home: const PostApiExample1(),
    );
  }
}
