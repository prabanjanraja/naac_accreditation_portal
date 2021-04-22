import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/public/data.dart';
import 'package:naac_accreditation_portal/public/shared.dart';
import 'package:naac_accreditation_portal/screens/Staff_Education/staff_education.dart';
import 'package:naac_accreditation_portal/services/database.dart';
import 'package:naac_accreditation_portal/services/loading.dart';
import 'package:provider/provider.dart';

import 'add_education.dart';

class StaffEducationList extends StatefulWidget {
  @override
  _StaffEducationListState createState() => _StaffEducationListState();
}

class _StaffEducationListState extends State<StaffEducationList> {
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    List<StaffEducation> experienceList =
        Provider.of<List<StaffEducation>>(context);

    if (experienceList == null)
      setState(
        () {
          isloading = true;
        },
      );
    else
      setState(
        () {
          isloading = false;
        },
      );
    final tiles = isloading
        ? null
        : experienceList.map(
            (StaffEducation education) => ListTile(
              title: Center(
                child: Text(
                  'Completed ' +
                      education.courseName +
                      ' at ' +
                      education.institutionName,
                  style: biggerFont,
                ),
              ),
              subtitle: Center(
                child: Text(
                  'Year of Completion: ' +
                      education.yearOfCompletion +
                      ' CGPA ' +
                      education.cgpa +
                      ' University Board' +
                      education.universityBoard,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  onDeletePressed(education.id);
                },
              ),
            ),
          );

    final divided = isloading
        ? null
        : ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

    return isloading
        ? Loading()
        : Scaffold(
            body: ListView(
              children: divided,
              padding: EdgeInsets.all(16.0),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add_circle_rounded,
                size: 50.0,
              ),
              onPressed: onAddEducation,
            ),
          );
  }

  Future<void> onAddEducation() async {
    final StaffEducation edu = await showDialog<StaffEducation>(
      context: context,
      builder: (_) => AddEducation(),
    );
    if (edu != null) {
      await datastore.doc(currentUser.uid).collection('education').add(
        {
          'courseName': edu.courseName,
          'institutionName': edu.institutionName,
          'universityBoard': edu.universityBoard,
          'yearOfCompletion': edu.yearOfCompletion,
          'cgpa': edu.cgpa,
        },
      );
    }
  }

  Future<void> onDeletePressed(String id) async {
    final bool confirmation = await showDialog<bool>(
      context: context,
      builder: (_) => DeleteConfirmation(),
    );
    if (confirmation)
      await datastore
          .doc(currentUser.uid)
          .collection('education')
          .doc(id)
          .delete();
  }
}
