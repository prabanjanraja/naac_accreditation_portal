import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/components/inputfield.dart';
import 'package:naac_accreditation_portal/screens/staff_experience/staff_experience.dart';

class AddExperience extends StatefulWidget {
  @override
  _AddExperienceState createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  String _orgName = '';
  String _fromDate = '';
  String _toDate = '';
  String _designation = '';
  String _totalExp = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text('ADD EXPERIENCE'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Experience',
              style: Theme.of(context).textTheme.headline4,
            ),
            textInputField(
              _orgName,
              'Organisation Name',
              fun: (val) {
                setState(
                  () {
                    _orgName = val;
                  },
                );
              },
            ),
            textInputField(
              _fromDate,
              'From Date',
              fun: (val) {
                setState(
                  () {
                    _fromDate = val;
                  },
                );
              },
            ),
            textInputField(
              _toDate,
              'To Date',
              fun: (val) {
                setState(
                  () {
                    _toDate = val;
                  },
                );
              },
            ),
            textInputField(
              _designation,
              'Designation',
              fun: (val) {
                setState(
                  () {
                    _designation = val;
                  },
                );
              },
            ),
            textInputField(
              _totalExp,
              'Total Experience',
              fun: (val) {
                setState(
                  () {
                    _totalExp = val;
                  },
                );
              },
            ),
            // _fromDate=showDatePicker(context: context, initialDate: initialDate, firstDate: firstDate, lastDate: lastDate);
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(
            context,
            null,
          ),
          child: Text('Clear All'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(
            context,
            StaffExperience.fromdialog(
              orgName: _orgName,
              fromDate: _fromDate,
              toDate: _toDate,
              totalExperience: _totalExp,
              designation: _designation,
            ),
          ),
          child: Text('Save'),
        ),
      ],
    );
  }
}
