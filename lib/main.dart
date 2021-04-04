import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:naac_accreditation_portal/services/auth.dart';
import 'package:naac_accreditation_portal/wrapper.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'signin.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => StreamProvider.value(
              value: AuthServices().userstream,
              initialData: null,
              child: Wrapper(),
            ),
        '/signin': (context) => SignUpScreen(),
        '/welcome': (context) => HomePage(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body:
            SignInForm() /* Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignInForm(),
          ),
        ),
      ), */
        );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome!', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}
