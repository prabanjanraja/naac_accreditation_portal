import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/public/shared.dart';
import 'package:naac_accreditation_portal/services/auth.dart';
import 'package:naac_accreditation_portal/services/loading.dart';
import 'components/inputfield.dart';
import 'progressindicator.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isLoading = false;

  String email = '', password = '', error = '', confirmPassword = '';

  AuthServices _auth = AuthServices();

  double _formProgress = 0;

  void updateformProgress() {
    var progress = 0.0;
    var controllers = [
      email,
      password,
      confirmPassword,
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
    var result = await _auth.registerWithEmailAndPassword(
      email,
      password,
    );
    if (result != null) {
      error = '';
      isLoading = false;
      Navigator.of(context).pop();
    } else {
      setState(() {
        isLoading = false;
        error = 'Invalid Credentials, Try again';
      });
      print('Error signing in the user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : customform(
            Form(
              onChanged: updateformProgress,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedProgressIndicator(
                    value: _formProgress,
                  ),
                  Text(
                    'Register ',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  textInputField(
                    email,
                    'User Name',
                    fun: (val) {
                      setState(
                        () {
                          email = val;
                        },
                      );
                    },
                  ),
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
                  textInputField(
                    confirmPassword,
                    'confirm Password',
                    password: true,
                    fun: (val) {
                      setState(() {
                        confirmPassword = val;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (password == confirmPassword) {
                        setState(() => isLoading = true);
                        dynamic result =
                            await _auth.registerWithEmailAndPassword(
                          email,
                          password,
                        );
                        if (result == null) {
                          setState(
                            () {
                              isLoading = false;
                              error = 'email already in use';
                            },
                          );
                        } else {
                          Navigator.of(context).pop();
                        }
                      } else
                        error = 'password does not match';
                    },
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
