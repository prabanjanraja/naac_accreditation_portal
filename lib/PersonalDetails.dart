import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/models/User.dart';
import 'package:naac_accreditation_portal/services/database.dart';
import 'package:provider/provider.dart';
import 'components/custombutton.dart';
import 'progressindicator.dart';

import 'components/inputfield.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  // final CustomUser user;
  String name;
  final _formKey = GlobalKey<FormState>();
  final _firstnameTextController = TextEditingController();
  final _lastnameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _dobTextController = TextEditingController();
  final _deptTextController = TextEditingController();

  double _formProgress = 0;

  // final dbservice = DataBaseService();

  void updateformProgress() {
    var progress = 0.0;
    // var controllers = [_firstnameTextController];
    var controllers = [
      _firstnameTextController,
      _lastnameTextController,
      _emailTextController,
      _dobTextController,
      _deptTextController
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

  updateDB(CustomUser user) {
    final String name = _firstnameTextController.text;
    user.name = name;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    name = user.uid;

    // _firstnameTextController.text = name;
    // _firstnameTextController.value = name as TextEditingValue;

    print('user id in personal delails is' + _firstnameTextController.text);
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
            _firstnameTextController,
            'First Name',
          ),
          textInputField(
            _lastnameTextController,
            'Last Name',
          ),
          textInputField(
            _emailTextController,
            'Email ID',
          ),
          textInputField(
            _dobTextController,
            'DOB',
          ),
          textInputField(
            _deptTextController,
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
