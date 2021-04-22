import 'package:cloud_firestore/cloud_firestore.dart';

class StaffEducation {
  String id;
  String institutionName;
  String yearOfCompletion;
  String universityBoard;
  String cgpa;
  String courseName;

  StaffEducation();

  StaffEducation.fromdialog({
    this.courseName,
    this.institutionName,
    this.yearOfCompletion,
    this.universityBoard,
    this.cgpa,
  });

  StaffEducation.fromSnapShots(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        id = snapshot.id,
        courseName = snapshot.data()['courseName'],
        institutionName = snapshot.data()['institutionName'],
        yearOfCompletion = snapshot.data()['yearOfCompletion'],
        universityBoard = snapshot.data()['universityBoard'],
        cgpa = snapshot.data()['cgpa'];
}
