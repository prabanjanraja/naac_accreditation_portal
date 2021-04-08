import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/public/data.dart';

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
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(e),
                  ),
                  body: staffDetails[e],
                );
              },
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
