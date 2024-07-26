// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/components/buttton.dart';
import 'package:socialapp/components/text_field.dart';
import 'package:socialapp/helper/helper_functions.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void login() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.landscape_outlined,
                size: 80,
              ),

              const SizedBox(height: 15),
              //app name
              Text('Login', style: TextStyle(fontSize: 20)),

              const SizedBox(height: 25),

              //email
              CustomTextField(hintText: 'Email', obscureText: false, controller: emailController),

              const SizedBox(height: 10),

              //password
              CustomTextField(hintText: 'Password', obscureText: true, controller: passwordController),

              const SizedBox(height: 10),
              //forgot password
              Text('Forgot password?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  )),
              const SizedBox(height: 25),
              //sign in button
              CustomButton(
                text: 'Sign In',
                onTap: login,
              ),
              const SizedBox(height: 10),
              //create account option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?  ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  GestureDetector(onTap: widget.onTap, child: Text('Register here', style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        )));
  }
}
