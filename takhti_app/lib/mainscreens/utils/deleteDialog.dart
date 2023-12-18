import 'package:flutter/material.dart';
import '../../core/util/deleteUser.dart';

void showDeleteAccountConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext bContext) => AlertDialog(
      title: Text('Delete Account'),
      content: Text(
          'Are you sure you want to delete your account? This action cannot be undone.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(bContext);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await deleteUser(bContext);
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/login');
          },
          child: Text('Delete'),
        ),
      ],
    ),
  );
}
