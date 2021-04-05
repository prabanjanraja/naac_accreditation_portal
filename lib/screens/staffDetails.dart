import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/public/data.dart';

class DetailsView extends StatelessWidget {
  final tiles = staffDetails.map(
    (e) => ListTile(
        title: Text(
      e,
      style: biggerFont,
    )),
  );

  @override
  Widget build(BuildContext context) {
    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Details'),
      ),
      body: ListView(children: divided),
    );
  }
}
