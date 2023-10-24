import 'package:flutter/material.dart';
import '../../theme/color_theme.dart';
import '../../theme/text_theme.dart';

void showPasswordDialog(BuildContext context, TextEditingController nameController, TextEditingController emailController, TextEditingController oldPassController) {
  final tt = CustomTextTheme();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Change your Password', style: tt.bold),
        content: Container(
          height: 300,
          width: MediaQuery.of(context).size.width >= 500 ? 500 : MediaQuery.of(context).size.width,
          constraints: BoxConstraints(
            maxHeight: 300,
            maxWidth: MediaQuery
                .of(context)
                .size
                .width >= 500 ? 500 : MediaQuery
                .of(context)
                .size
                .width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title(color: AppColorsDark.primaryBlack,
                  child: Text('Enter new Password', style: tt.bodyText1)),
              const SizedBox(height: 6.0),
              TextField(
                controller: newPassController,
                decoration: InputDecoration(
                  hintText: 'Enter Password?',
                  hintStyle: tt.subtitle2,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              Title(color: AppColorsDark.primaryBlack,
                  child: Text('Confirm Password', style: tt.bodyText1)),
              const SizedBox(height: 6.0),
              TextField(
                controller: confirmPassController,
                decoration: InputDecoration(
                  hintText: 'Confirm your Password',
                  hintStyle: tt.subtitle2,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20.0),
              Title(color: AppColorsDark.primaryBlack,
                  child: Text('Enter current Password', style: tt.bodyText1)),
              const SizedBox(height: 6.0),
              TextField(
                controller: oldPassController,
                decoration: InputDecoration(
                  hintText: 'Enter current Password',
                  hintStyle: tt.subtitle2,
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
            },
            child: Text('Update'),
          ),
        ],
      );
    },
  );
}