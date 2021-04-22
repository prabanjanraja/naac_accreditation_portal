import 'package:naac_accreditation_portal/screens/Staff_Education/staff_education_list.dart';
import 'package:naac_accreditation_portal/services/database.dart';
import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/screens/staff_experience/staff_experience_list.dart';
import 'package:provider/provider.dart';

Map<String, MaterialPageRoute> staffDetails = {
  'Staff Experience': MaterialPageRoute<void>(
    builder: (context) => StreamProvider.value(
      value: DataBaseService(currentUser.uid).loadExperience,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Staff Experience'),
        ),
        body: StaffExperienceList(),
      ),
    ),
  ),
  'Staff Education': MaterialPageRoute<void>(
    builder: (context) => StreamProvider.value(
      value: DataBaseService(currentUser.uid).loadEducation,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Staff Education'),
        ),
        body: StaffEducationList(),
      ),
    ),
  ),
};
//   'Staff Experience',
//   'Journal',
//   'Sports',
// ];

final biggerFont = TextStyle(fontSize: 20.0);
