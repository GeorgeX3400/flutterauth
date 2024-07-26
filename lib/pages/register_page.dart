// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/components/buttton.dart';
import 'package:socialapp/components/text_field.dart';
import 'package:socialapp/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  void register() async {
    //show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    // check if the passwords match
    if (passwordController.text != confirmPasswordController.text) {
      displayMessageToUser("Passwords don't match!", context);
      Navigator.pop(context);
    }
    //show error to user
    
    // create the user and add to firebase
    try {
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
      );
      
      //pop loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop loading circle
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

              //username
              CustomTextField(hintText: 'Username', obscureText: false, controller: usernameController),

              const SizedBox(height: 10),

              //email
              CustomTextField(hintText: 'Email', obscureText: false, controller: emailController),

              const SizedBox(height: 10),

              //password
              CustomTextField(hintText: 'Password', obscureText: true, controller: passwordController),

              const SizedBox(height: 10),

              // confirm password
              CustomTextField(hintText: 'Confirm password', obscureText: true, controller: confirmPasswordController),

              const SizedBox(height: 10),
              //forgot password
              Text('Forgot password?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  )),
              const SizedBox(height: 25),
              //sign in button
              CustomButton(
                text: 'Register',
                onTap: register,
              ),
              const SizedBox(height: 10),
              //create account option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?  ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                  GestureDetector(onTap: widget.onTap, child: Text('Login here', style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        )));
  }
}
