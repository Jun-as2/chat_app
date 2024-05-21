import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp(
    appTheme: AppTheme(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.appTheme});

  final AppTheme appTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.dark,
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
