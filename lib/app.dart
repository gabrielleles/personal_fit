import 'package:flutter/material.dart';
import 'modules/personals/presentation/pages/home_page.dart';

class PersonalFitApp extends StatelessWidget {
  const PersonalFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Fit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
