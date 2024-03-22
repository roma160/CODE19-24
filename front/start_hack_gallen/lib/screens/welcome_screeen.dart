import 'package:flutter/material.dart';
import 'package:start_hack_gallen/screens/sign_in.dart';
import 'package:start_hack_gallen/screens/sign_up.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome to NutriPlates",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          const Text("NutriPlates",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          const Text("Your food tracking companion",
              style: TextStyle(fontSize: 18)),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((ctx) => const SignUpPage()),
                      ),
                    );
                  },
                  child: const Text("Sign up")),
              SizedBox(
                width: MediaQuery.of(context).size.width / 7,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((ctx) => const SignInPage()),
                      ),
                    );
                  },
                  child: const Text("Sign in")),
            ],
          ),
        ],
      ),
    );
  }
}
