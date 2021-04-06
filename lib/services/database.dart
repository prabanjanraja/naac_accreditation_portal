import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naac_accreditation_portal/models/User.dart';

class DataBaseService {
  final CollectionReference datastore =
      FirebaseFirestore.instance.collection('staffs');

  final String uid;

  DataBaseService(this.uid);

  Future update(PersonalDetails user) async {
    // // await datastore.doc(uid).update({
    //   'user id': user.uid,
    //   'name': user.name,
    // });
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
}
