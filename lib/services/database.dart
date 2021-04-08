import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naac_accreditation_portal/models/User.dart';
import 'package:naac_accreditation_portal/screens/staff_experience/staff_experience.dart';

final CollectionReference datastore =
    FirebaseFirestore.instance.collection('staffs');

class DataBaseService {
  final String uid;

  DataBaseService(this.uid);

  Future update(PersonalDetails user) async {
    print('update on database');
    await datastore.doc(uid).set(
      {
        // 'user id': user.uid,
        'first name': user.firstname,
        'last name': user.lastname,
        'email': user.email,
        'date of birth': user.dob,
        'department': user.dept,
      },
      SetOptions(merge: true),
    );
  }

  Future<void> addExperienceToDB({StaffExperience experience}) async {
    print('Add staff Experience');

    await datastore.doc(uid).collection('experience').doc().set(
      {
        'Org Name': experience.orgName,
        'Designation': experience.designation,
        'From Date': experience.fromDate,
        'To Date': experience.toDate,
        'total experience': experience.totalExperience,
      },
      SetOptions(merge: true),
    );
  }
}

CustomUser currentUser;
DataBaseService userDataBase;
