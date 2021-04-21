import 'package:flutter/material.dart';

customform(input) {
  return Center(
    child: SizedBox(
      width: 400,
      child: Card(
        child: input,
      ),
    ),
  );
}

class DeleteConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Do you want to Delete this record ?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('NO'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text('YES'),
        )
      ],
    );
  }
}
