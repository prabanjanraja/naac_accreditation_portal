import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/public/data.dart';
import 'package:naac_accreditation_portal/services/database.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tiles = staffDetails.keys.map(
      (String e) => ListTile(
        title: Center(
          child: Text(
            e,
            style: biggerFont,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => StreamProvider.value(
                value: DataBaseService(currentUser.uid).loadExperience,
                initialData: null,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(e),
                  ),
                  body: staffDetails[e],
                ),
              ),
/*               (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(e),
                  ),
                  body: staffDetails[e],
                );
              }, */
            ),
          );
        },
      ),
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Details'),
      ),
      body: ListView(
        children: divided,
        padding: EdgeInsets.all(16.0),
      ),
    );
  }
}
