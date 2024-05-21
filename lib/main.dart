import 'package:chat_app/screens/sign_in_screen.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
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
      home: const SignInScreen(),
    );
  }
}
