import 'package:flutter/material.dart';

import 'Academic.dart';

class OtherDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('other details'),
      ],
    );
  }
}

class DynamicScreen extends StatefulWidget {
  @override
  _DynamicScreenState createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  Map screensMap = {
    'academic': Academic(),
    'other': 'other',
  };
  String _selectedScreen = 'academic';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton(
            value: _selectedScreen,
            onChanged: (newvalue) {
              setState(() {
                _selectedScreen = newvalue;
              });
            },
            hint: Text('Select a Screen'),
            items: screensMap.keys
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ),
                )
                .toList(),
          ),
          screensMap[_selectedScreen]
        ],
      ),
    );
  }
}
