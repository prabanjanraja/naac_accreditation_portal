import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/public/data.dart';
import 'package:naac_accreditation_portal/public/shared.dart';
import 'package:naac_accreditation_portal/screens/staff_experience/add_experience.dart';
import 'package:naac_accreditation_portal/screens/staff_experience/staff_experience.dart';
import 'package:naac_accreditation_portal/services/database.dart';
import 'package:naac_accreditation_portal/services/loading.dart';
import 'package:provider/provider.dart';

class StaffExperienceList extends StatefulWidget {
  @override
  _StaffExperienceListState createState() => _StaffExperienceListState();
}

class _StaffExperienceListState extends State<StaffExperienceList> {
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    List<StaffExperience> experienceList =
        Provider.of<List<StaffExperience>>(context);

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
            (StaffExperience experience) => ListTile(
              title: Center(
                child: Text(
                  experience.orgName,
                  style: biggerFont,
                ),
              ),
              subtitle: Text(
                'Duration: ' +
                    experience.fromDate +
                    ' - ' +
                    experience.toDate +
                    ' as ' +
                    experience.designation,
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  onDeletePressed(experience.id);
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
              onPressed: onAddExperience,
            ),
          );
  }

  Future<void> onAddExperience() async {
    final StaffExperience exp = await showDialog<StaffExperience>(
      context: context,
      builder: (_) => AddExperience(),
    );
    if (exp != null) {
      DataBaseService(currentUser.uid).addExperienceToDB(experience: exp);
    }
    print(exp);
  }

  Future<void> onDeletePressed(String id) async {
    final bool confirmation = await showDialog<bool>(
      context: context,
      builder: (_) => DeleteConfirmation(),
    );
    if (confirmation)
      DataBaseService(currentUser.uid).deleteExperienceFromDB(
        id: id,
      );
  }
}
