import 'package:flutter/material.dart';
import 'package:takhti_app/core/util/authUser.dart';
import '../../core/util/updateUser.dart';
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
              bool toClose = false;
              if(newPassController.text.isNotEmpty && confirmPassController.text.isNotEmpty && oldPassController.text.isNotEmpty) {
                if (newPassController.text == confirmPassController.text) {
                  if (newPassController.text != oldPassController.text) {
                    if(authenticateUser(context, emailController, oldPassController)){
                      updateUser(context, nameController, emailController, newPassController);
                      toClose = true;
                    } else {
                      SnackBar snackBar = SnackBar(
                        content: Text('Sorry! We could not authenticate you with the provided current password.', style: tt.snackbarText,),
                        backgroundColor: Colors.redAccent,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else {
                    SnackBar snackBar = SnackBar(
                      content: Text('New password can\'t be same as Current password',
                        style: tt.snackbarText,),
                      backgroundColor: Colors.redAccent,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  SnackBar snackBar = SnackBar(
                    content: Text(
                      'Passwords do not match', style: tt.snackbarText,),
                    backgroundColor: Colors.redAccent,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
              else{
                SnackBar snackBar = SnackBar(
                  content: Text(
                    'Please fill all the fields', style: tt.snackbarText,),
                  backgroundColor: Colors.redAccent,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              // Close the dialog
              if (toClose){
                Navigator.of(context).pop();
              }
            },
            child: Text('Update'),
          ),
        ],
      );
    },
  );
}