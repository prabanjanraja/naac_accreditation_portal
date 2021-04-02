import 'package:flutter/material.dart';
import 'components/custombutton.dart';
import 'components/inputfield.dart';
import 'progressindicator.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final _passwordTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  void updateformProgress() {
    var progress = 0.0;
    var controllers = [
      _usernameTextController,
      _passwordTextController,
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showHomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: updateformProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('Sign In', style: Theme.of(context).textTheme.headline4),
          textInputField(_usernameTextController, 'User Name'),
          textInputField(_passwordTextController, 'Password', password: true),
          customButton('Sign In', _formProgress, _showHomeScreen),
        ],
      ),
    );
  }
}
