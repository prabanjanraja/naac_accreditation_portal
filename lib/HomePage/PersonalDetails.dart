import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/models/User.dart';
import 'package:provider/provider.dart';
import '../components/custombutton.dart';
import '../progressindicator.dart';

import '../components/inputfield.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  // final CustomUser user;
  String name;
  final _formKey = GlobalKey<FormState>();
  String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _dob = '';
  String _dept = '';

  double _formProgress = 0;

  // final dbservice = DataBaseService();

  void updateformProgress() {
    var progress = 0.0;
    // var controllers = [_firstnameTextController];
    var controllers = [
      _firstname,
      _lastname,
      _email,
      _dob,
      _dept,
    ];

    for (var controller in controllers) {
      if (controller.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  updateDB(CustomUser user) {
    final String name = _firstname;
    user.name = name;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    name = user.uid;

    // _firstnameTextController.text = name;
    // _firstnameTextController.value = name as TextEditingValue;

    print('user id in personal delails is' + _firstname);
    // final userrecord = DataBaseService(_user.uid);
    return Form(
      key: _formKey,
      onChanged: updateformProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('User Details', style: Theme.of(context).textTheme.headline4),
          textInputField(
            _firstname,
            'First Name',
          ),
          textInputField(
            _lastname,
            'Last Name',
          ),
          textInputField(
            _email,
            'Email ID',
          ),
          textInputField(
            _dob,
            'DOB',
          ),
          textInputField(
            _dept,
            'Department',
          ),
          customButton(
            'update',
            _formProgress,
            updateDB,
          ),
        ],
      ),
    );
  }
}
