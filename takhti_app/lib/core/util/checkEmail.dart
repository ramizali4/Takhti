import 'package:flutter/material.dart';
import '../apis/conn_api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../theme/text_theme.dart';

 checkEmail(BuildContext context,TextEditingController emailController) async {
  final tt = CustomTextTheme();
    try {
      var res = await http.post(
        Uri.parse(API.valMail),
        body: {
          'Email': emailController.text.trim(),
        },
      );
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (resBody['response']) {
          SnackBar snackBar = SnackBar(
            content: Text(
              'Email already in use!',
              style: tt.snackbarText,
            ),
            backgroundColor: Colors.redAccent,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print("Email already in use!");
          return false;
        } else {
          print("Email is available!");
          return true;
        }
      }
    } catch (e) {
      print(e.toString());
      return true;
    }
}
