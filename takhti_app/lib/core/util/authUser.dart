import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/core/apis/conn_api.dart';
import '/theme/text_theme.dart';

authenticateUser(BuildContext context, TextEditingController _emailController,TextEditingController _passwordController) async {
  final tt = CustomTextTheme();
  try {
    var res = await http.post(
      Uri.parse(API.signin),
      body: {
        'Email': _emailController.text.trim(),
        'Password': _passwordController.text.trim(),
      },
    );
    if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
  } catch (e) {
    print(e.toString());
  }
}
