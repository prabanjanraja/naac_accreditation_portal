import 'package:flutter/material.dart';
import 'package:naac_accreditation_portal/HomePage.dart';
import 'package:naac_accreditation_portal/main.dart';
import 'package:naac_accreditation_portal/models/User.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    print(user);
    return user != null ? HomePage() : SignUpScreen();
  }
}
