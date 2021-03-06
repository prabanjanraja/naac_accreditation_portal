import 'package:flutter/material.dart';

Padding textInputField(String variable, hint,
    {password = false, Function fun}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextFormField(
      readOnly: false,
      obscureText: password,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      initialValue: variable,
      onChanged: fun,
      decoration: InputDecoration(
        labelText: hint,
      ),
    ),
  );
}

// const 
