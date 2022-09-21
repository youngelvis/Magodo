import 'package:flutter/material.dart';
class CustomisedAlertDialog extends StatelessWidget {
  final message;
  const CustomisedAlertDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(message),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("ok"))
      ],
    );
  }
}
