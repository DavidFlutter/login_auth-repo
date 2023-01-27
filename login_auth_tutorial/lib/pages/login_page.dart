import 'package:flutter/material.dart';
import 'package:login_auth_tutorial/pages/utils/my_button_one.dart';
import 'package:login_auth_tutorial/pages/utils/my_button_two.dart';

import 'utils/text_input_area.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              Icon(
                Icons.lock,
                size: 70,
              ),
              SizedBox(height: 30),
              Text("Welcome back"),
              SizedBox(height: 20),
              TextInputArea(
                isPass: false,
                labelText: "Email",
              ),
              SizedBox(height: 10),
              TextInputArea(
                isPass: true,
                labelText: "Password",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Spacer(),
                  Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),
              MyButton(buttonText: "Login"),
              SizedBox(height: 30),
              Text("Or continue with"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButtonTwo("lib/assets/apple.png"),
                  SizedBox(width: 20),
                  MyButtonTwo("lib/assets/google.png"),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Register now",
                style: TextStyle(color: Colors.blue),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
