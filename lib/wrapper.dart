import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/HomePage/HomePage.dart';
import 'package:naac_accreditation_portal/main.dart';
import 'package:naac_accreditation_portal/models/User.dart';
import 'package:naac_accreditation_portal/services/database.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    currentUser = user;
    userDataBase = DataBaseService(currentUser.uid);
    print(user);
    return user != null ? HomePage() : SignUpScreen();
  }
}
