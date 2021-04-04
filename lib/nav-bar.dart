import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/services/auth.dart';

class Navbar extends StatelessWidget {
  final _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
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
            onTap: () {},
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
