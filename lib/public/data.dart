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
  'Staff Event Organized': MaterialPageRoute<void>(
    builder: (context) => StreamProvider.value(
      value: DataBaseService(currentUser.uid).loadEducation,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Staff Event Organized'),
        ),
        body: StaffEducationList(),
      ),
    ),
  ),
  'Staff Event Funded': MaterialPageRoute<void>(
    builder: (context) => StreamProvider.value(
      value: DataBaseService(currentUser.uid).loadEducation,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Staff Event Funded'),
        ),
        body: StaffEducationList(),
      ),
    ),
  ),
  'Staff Online Courses': MaterialPageRoute<void>(
    builder: (context) => StreamProvider.value(
      value: DataBaseService(currentUser.uid).loadEducation,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Staff Online Courses'),
        ),
        body: StaffEducationList(),
      ),
    ),
  ),
  'Staff Industry Training': MaterialPageRoute<void>(
    builder: (context) => StreamProvider.value(
      value: DataBaseService(currentUser.uid).loadEducation,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Staff Industry Training'),
        ),
        body: StaffEducationList(),
      ),
    ),
  ),
  'Staff Journal Publication': MaterialPageRoute<void>(
    builder: (context) => StreamProvider.value(
      value: DataBaseService(currentUser.uid).loadEducation,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Staff Journal Publication'),
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
