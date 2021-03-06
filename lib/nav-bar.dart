import 'dart:math';

import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/services/auth.dart';

class Navbar extends StatelessWidget {
  final _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Icon(
              Icons.person,
              size: 100.0,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.table_view),
            title: Text('View records'),
            onTap: () {
              Navigator.of(context).pushNamed('/view');
            },
          ),
          Spacer(
            flex: 3,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  _auth.signOut();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
