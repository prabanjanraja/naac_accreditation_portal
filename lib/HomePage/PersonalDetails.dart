import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/models/User.dart';
import 'package:naac_accreditation_portal/services/database.dart';
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
  bool isloading = true;
  final _formKey = GlobalKey<FormState>();
  String _firstname = '';
  String _lastname = '';
  String _email = '';
  String _dob = '';
  String _dept = '';

  double _formProgress = 0;

  // final dbservice = DataBaseService();

  void updateformProgress() {
    double progress = 0.0;
    List<String> controllers = [
      _firstname,
      _lastname,
      _email,
      _dob,
      _dept,
    ];

    for (String controller in controllers) {
      if (controller != '') {
        progress += 1 / controllers.length;
      }
    }

    setState(
      () {
        _formProgress = progress;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user_ = Provider.of<CustomUser>(context);
    final user = PersonalDetails(user_.uid);

    final DataBaseService _dbservice = DataBaseService(user.uid);

    updateDB() {
      // isloading = true;
      print('updateDB fun call');
      user.firstname = _firstname;
      user.lastname = _lastname;
      user.dept = _dept;
      user.email = _email;
      user.dob = _dob;
      _dbservice.update(user);
      setState(
        () {
          isloading = true;
        },
      );
    }

    ;

    if (isloading) {
      _firstname = user.firstname;
      _lastname = '';
      isloading = false;
    }
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
            fun: (val) {
              setState(
                () {
                  _firstname = val;
                },
              );
            },
          ),
          textInputField(
            _lastname,
            'Last Name',
            fun: (val) {
              setState(
                () {
                  _lastname = val;
                },
              );
            },
          ),
          textInputField(
            _email,
            'Email ID',
            fun: (val) {
              setState(
                () {
                  _email = val;
                },
              );
            },
          ),
          textInputField(
            _dob,
            'DOB',
            fun: (val) {
              setState(
                () {
                  _dob = val;
                },
              );
            },
          ),
          textInputField(
            _dept,
            'Department',
            fun: (val) {
              setState(
                () {
                  _dept = val;
                },
              );
            },
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
