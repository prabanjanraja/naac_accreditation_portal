import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/nav-bar.dart';
import 'package:naac_accreditation_portal/public/shared.dart';
import 'package:naac_accreditation_portal/services/auth.dart';
import 'PersonalDetails.dart';
import 'other details.dart';

class HomePage extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Navbar(),
          appBar: AppBar(
            title: Text('NAAC-ACCREDITIATION PORTAL'),
            actions: [
              IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () async {
                    _auth.signOut();
                  })
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Staff Details',
                ),
                Tab(
                  text: 'Other Details',
                )
              ],
            ),
          ),
          backgroundColor: Colors.grey[200],
          body: TabBarView(
            children: [
              /* Center(
                child: SizedBox(
                  width: 400,
                  child: Card(
                    child: UserDetails(),
                  ),
                ),
              ), */
              customform(UserDetails()),
              DynamicScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
