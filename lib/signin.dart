import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/public/shared.dart';
import 'package:naac_accreditation_portal/services/auth.dart';
import 'package:naac_accreditation_portal/services/loading.dart';
import 'components/custombutton.dart';
import 'components/inputfield.dart';
import 'progressindicator.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String email = '', password = '', error = '';

  AuthServices _auth = AuthServices();

  double _formProgress = 0;

  void updateformProgress() {
    var progress = 0.0;
    var controllers = [
      email,
      password,
    ];

    for (var controller in controllers) {
      if (controller != '') {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _validate() async {
    setState(() {
      isLoading = true;
    });
    var result = await _auth.signIn(email, password);
    if (result != null) {
      error = '';
      print('user signed in ');
      print('email is ' + email);
      print(password);
      // _showHomeScreen();
    } else {
      setState(() {
        isLoading = false;
        error = 'Invalid Credentials, Try again';
      });
      print('Error signing in the user');
    }
  }

  /* void _showHomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  } */

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : customform(
            Form(
              key: _formKey,
              onChanged: updateformProgress,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedProgressIndicator(value: _formProgress),
                  Text('Sign In', style: Theme.of(context).textTheme.headline4),
                  textInputField(email, 'User Name', fun: (val) {
                    setState(() {
                      email = val;
                    });
                  }),
                  textInputField(
                    password,
                    'Password',
                    password: true,
                    fun: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  customButton(
                    'Sign In',
                    _formProgress,
                    _validate,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text('register for a new user'),
                  ),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
