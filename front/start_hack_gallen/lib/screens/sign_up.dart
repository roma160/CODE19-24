import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:start_hack_gallen/models/user.dart';
import 'package:start_hack_gallen/widgtes/text_field.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();

  final _nameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _passwordRepeatController = TextEditingController();

  bool isPassword = true;

  bool isRepeatedPassword = true;

  Future<void> _reg() async {
    final username = _nameController.text;
    final password = _passwordController.text;

    // We are creating a user object here for the sake of example
    // You would typically use this user object in a login method to auth with backend
    User user =
        User(name: username, email: _emailController.text, password: password);

    // Your SignIn logic using your User object. For example:
    String url = "https://code1924.azurewebsites.net/register";
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(user.toJson()), // Convert your user to a JSON string
      headers: {"Content-Type": "application/json"},
    );

    // Check the response status and do somethin
    print(jsonEncode(user.toJson()));
    print(response.statusCode);
    print(response.body);
    print('Name: ${user.name}, Password: ${user.password}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign up",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 50),
                child: ReusableTextField(
                  controller: _nameController,
                  isPassword: false,
                  hintText: 'name',
                  textInputType: TextInputType.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 50),
                child: ReusableTextField(
                  controller: _emailController,
                  isPassword: false,
                  hintText: 'Phone number',
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 50),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableTextField(
                        controller: _passwordController,
                        isPassword: isPassword,
                        hintText: 'password',
                        textInputType: TextInputType.text,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 50),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableTextField(
                        controller: _passwordRepeatController,
                        isPassword: isRepeatedPassword,
                        hintText: 'repeat password',
                        textInputType: TextInputType.text,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isRepeatedPassword = !isRepeatedPassword;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _reg();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Sign in"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
