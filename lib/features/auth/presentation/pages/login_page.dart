/*

LOGIN PAGE

On this page, and existing user can login with their:

- email
- pw

-------------------------------------------------------------------------------

Once the user successfully logs in, they will be redirected to the home page.

If users doesn't have an account, they can go to register page from here to create one

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/features/auth/presentation/components/my_button.dart';
import 'package:flutter_bloc_template/features/auth/presentation/components/my_textfield.dart';
import 'package:flutter_bloc_template/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function() onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //  text Editing Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //login method
  void login() {
    //prepare email & pw
    final String email = emailController.text;
    final String pw = passwordController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    //ensure that the email & pw are not empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      //login
      authCubit.login(email, pw);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.delivery_dining_outlined,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            SizedBox(height: 20),

            // message, app slogan
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 25),

            // email input
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            SizedBox(height: 10),
            // password input
            MyTextField(
              controller: passwordController,
              hintText: "Contraseña",
              obscureText: true,
            ),

            SizedBox(height: 10),

            // login button
            MyButton(text: "Sign In", onTap: login),

            SizedBox(height: 25),

            //not a member? sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
