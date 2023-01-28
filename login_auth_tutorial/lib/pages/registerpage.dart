import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_auth_tutorial/pages/login_page.dart';
import 'package:login_auth_tutorial/services/auth_services.dart';
import 'package:login_auth_tutorial/utils/my_button_one.dart';
import 'package:login_auth_tutorial/utils/my_button_two.dart';

import '../utils/text_input_area.dart';

class RegisterPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void goBack() {
      Navigator.pop(context);
    }

    void displayMessage(var message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade300,
            title: Column(
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Alright",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void wrongDetail(var message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade300,
            title: Column(
              children: [
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Retry",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void signUp() async {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      // Place code to sign a user in here
      try {
        if (passwordController.text == confPasswordController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          Navigator.pop(context);
          displayMessage("Account created");
        } else {
          Navigator.pop(context);
          wrongDetail("Password and Confirm password are not the same");
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "user-not-found") {
          Navigator.pop(context);
          print(" User not found");
          wrongDetail("Incorect username");
        } else if (e.code == "wrong-password") {
          Navigator.pop(context);
          print("Incorret password");
          wrongDetail("Incorect password");
        }
      }
      // Navigator.pop(context);

      passwordController.clear();
      confPasswordController.clear();
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          padding: EdgeInsets.all(20),
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(scrollbars: false),
            child: ListView(
              children: [
                Spacer(),
                const Icon(
                  Icons.lock,
                  size: 50,
                ),
                SizedBox(height: 30),
                Center(child: Text("Welcome")),
                SizedBox(height: 20),
                TextInputArea(
                  isPass: false,
                  labelText: "Email",
                  myContoller: emailController,
                ),
                SizedBox(height: 10),
                TextInputArea(
                  isPass: true,
                  labelText: "Password",
                  myContoller: passwordController,
                ),
                SizedBox(height: 10),
                TextInputArea(
                  isPass: true,
                  labelText: "Confrim password",
                  myContoller: confPasswordController,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      " ",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    signUp();
                  },
                  child: MyButton(buttonText: "Register"),
                ),
                SizedBox(height: 30),
                Center(child: const Text("Or continue with")),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          displayMessage(
                              "Sorry this service is not yet available");
                        },
                        child: MyButtonTwo("lib/assets/apple.png")),
                    SizedBox(width: 30),
                    GestureDetector(
                        onTap: () {
                          displayMessage(
                              "Sorry this service is not yet available");
                        },
                        child: MyButtonTwo("lib/assets/google.png")),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        goBack();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
