import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:start_hack_gallen/main.dart';
import 'package:start_hack_gallen/screens/info_list.dart';
import '../widgtes/text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Future<void> _login(context) async {
    final email = _phoneNumberController.text;
    final password = _passwordController.text;

    // We are creating a user object here for the sake of example
    // You would typically use this user object in a login method to auth with backend

    // Your SignIn logic using your User object. For example:
    String url = "https://code1924.azurewebsites.net/login";
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
      }), // Convert your user to a JSON string
      headers: {"Content-Type": "application/json"},
    );

    // Check the response status and do somethin
    print(response.statusCode);
    print(response.body);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((ctx) => const MyApp()),
      ),
    );
  }

  final _phoneNumberController = TextEditingController();
  bool isPassword = true;

  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign in",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 50),
              child: ReusableTextField(
                controller: _phoneNumberController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: const Text("Sign in"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
