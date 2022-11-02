import 'package:flutter/material.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Classified App',
      theme: CustomTheme().theme,
      onGenerateRoute: RouteGenerator().generate,
    );
  }
}