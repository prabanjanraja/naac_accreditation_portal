import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:naac_accreditation_portal/screens/staffDetails.dart';
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
        '/view': (context) => DetailsView(),
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
      body: SignInForm(),
    );
  }
}
