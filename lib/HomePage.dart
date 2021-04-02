import 'package:flutter/material.dart';
import 'PersonalDetails.dart';
import 'other%20details.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
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
              Center(
                child: SizedBox(
                  width: 400,
                  child: Card(
                    child: UserDetails(),
                  ),
                ),
              ),
              DynamicScreen(),
              // Center(
              //   child: SizedBox(
              //     width: 400,
              //     child: Card(
              //       child: OtherDetails(),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
