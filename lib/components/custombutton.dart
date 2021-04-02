import 'package:flutter/material.dart';

TextButton customButton(name, formProgress, function) {
  return TextButton(
    style: ButtonStyle(
      foregroundColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        return states.contains(MaterialState.disabled) ? null : Colors.white;
      }),
      backgroundColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        return states.contains(MaterialState.disabled) ? null : Colors.blue;
      }),
    ),
    onPressed: formProgress == 1
        ? () {
            function();
          }
        : null,
    child: Text(name),
  );
}
