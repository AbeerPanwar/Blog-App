import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/Auth/presentation/pages/sign_up.dart';
import 'package:blog_app/features/Auth/presentation/pages/sing_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkTheme,
      routes: {
        'signUpPage' : (context) => SignUpPage(),
        'signInPage' : (context) => SignInPage(),
      },
      home: const SignInPage(),
    );
  }
}
