import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/screens/staff_experience/add_experience.dart';
import 'package:naac_accreditation_portal/screens/staff_experience/staff_experience.dart';
import 'package:naac_accreditation_portal/services/database.dart';

class StaffExperienceList extends StatefulWidget {
  @override
  _StaffExperienceListState createState() => _StaffExperienceListState();
}

class _StaffExperienceListState extends State<StaffExperienceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_circle_rounded,
          size: 50.0,
        ),
        onPressed: onAddExperence,
      ),
    );
  }

  Future<void> onAddExperence() async {
    final StaffExperience exp = await showDialog<StaffExperience>(
      context: context,
      builder: (_) => AddExperience(),
    );
    if (exp != null) {
      DataBaseService(currentUser.uid).addExperienceToDB(experience: exp);
    }
    print(exp);
  }

  onExperiencPressed() {}
}
