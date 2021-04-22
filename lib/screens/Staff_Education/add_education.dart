import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/components/inputfield.dart';
import 'package:naac_accreditation_portal/screens/Staff_Education/staff_education.dart';

class AddEducation extends StatefulWidget {
  @override
  _AddEducationState createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  String _courseName = '';
  String _institutionName = '';
  String _yearOfCompletion = '';
  String _universityBoard = '';
  String _cgpa = '';
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
              _courseName,
              'Course Name',
              fun: (val) {
                setState(
                  () {
                    _courseName = val;
                  },
                );
              },
            ),
            textInputField(
              _institutionName,
              'Institution Name',
              fun: (val) {
                setState(
                  () {
                    _institutionName = val;
                  },
                );
              },
            ),
            textInputField(
              _yearOfCompletion,
              'Year of completion',
              fun: (val) {
                setState(
                  () {
                    _yearOfCompletion = val;
                  },
                );
              },
            ),
            textInputField(
              _universityBoard,
              'University Board',
              fun: (val) {
                setState(
                  () {
                    _universityBoard = val;
                  },
                );
              },
            ),
            textInputField(
              _cgpa,
              'CGPA',
              fun: (val) {
                setState(
                  () {
                    _cgpa = val;
                  },
                );
              },
            ),
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
            StaffEducation.fromdialog(
              courseName: _courseName,
              institutionName: _institutionName,
              universityBoard: _universityBoard,
              yearOfCompletion: _yearOfCompletion,
              cgpa: _cgpa,
            ),
          ),
          child: Text('Save'),
        ),
      ],
    );
  }
}
