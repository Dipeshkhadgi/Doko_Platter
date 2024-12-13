import 'package:doko/views/login_view.dart';
import 'package:doko/views/onboarding_view.dart';
import 'package:doko/views/sign_up_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DokoPlatterApp());
}

class DokoPlatterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doko Platter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingView(),
        '/signup': (context) => SignUpView(),
        '/login': (context) => LoginView(),
      },
    );
  }
}