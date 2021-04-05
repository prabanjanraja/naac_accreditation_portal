import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naac_accreditation_portal/models/User.dart';

class DataBaseService {
  final CollectionReference datastore =
      FirebaseFirestore.instance.collection('staffs');

  final String uid;

  DataBaseService(this.uid);

  Future update(CustomUser user) async {
    await datastore.doc(uid).update({
      'name': user.name,
    });
  }
}
