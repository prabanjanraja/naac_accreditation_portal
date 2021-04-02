import 'package:flutter/material.dart';

Padding textInputField(controller, hint, {password = false}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextFormField(
      obscureText: password,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
    ),
  );
}
