import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc_template/features/auth/presentation/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _LoginOrRegisteState();
}

class _LoginOrRegisteState extends State<AuthPage> {
  // Initially, show the login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
