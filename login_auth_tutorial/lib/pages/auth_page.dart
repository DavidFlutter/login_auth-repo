//This page check is the user is sign in or not and returns the
// login page if they are not or the homepage if they are

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_auth_tutorial/pages/login_page.dart';

import 'homepage.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
