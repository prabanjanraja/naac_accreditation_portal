import 'package:cloud_firestore/cloud_firestore.dart';

class StaffExperience {
  String orgName;
  String fromDate;
  String toDate;
  String totalExperience;
  String designation;
  String id;

  StaffExperience();

  StaffExperience.fromdialog({
    this.orgName,
    this.fromDate,
    this.toDate,
    this.totalExperience,
    this.designation,
  });

  StaffExperience.fromSnapShots(DocumentSnapshot snapshot)
      : assert(snapshot != null),
        id = snapshot.id,
        orgName = snapshot.data()['Org Name'],
        fromDate = snapshot.data()['From Date'],
        toDate = snapshot.data()['To Date'],
        designation = snapshot.data()['Designation'],
        totalExperience = snapshot.data()['total experience'];
}
