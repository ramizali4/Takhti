import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '/UserPref.dart';
import '/core/apis/conn_api.dart';
import '/theme/text_theme.dart';
import '/core/models/user.dart';

loginUser(BuildContext context, TextEditingController _emailController,TextEditingController _passwordController) async {
  final tt = CustomTextTheme();
  try {
    // print('Email: ${_emailController.text.trim()}');
    var res = await http.post(
      Uri.parse(API.signin),
      body: {
        'Email': _emailController.text.trim(),
        'Password': _passwordController.text.trim(),
      },
    );
    // print('Response: ${res.statusCode}');
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      if (resBody['response']) {
        user = User.fromJson(resBody['data']);
        // print('User: ${user?.name}');
        SnackBar snackBar = SnackBar(
          content: Text('Hi ${user?.name}! Welcome back.', style: tt.snackbarText,),
          backgroundColor: Colors.lightGreen,
        );
        _emailController.text = '';
        _passwordController.text = '';
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushNamed(context, '/my_home_page');
      } else {
        SnackBar snackBar = SnackBar(
          content: Text('Incorrect email/password combination. Try again!', style: tt.snackbarText,),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    else
      {
        SnackBar snackBar = SnackBar(
          content: Text('Something went wrong. Try again!\n Error code: ${res.statusCode}', style: tt.snackbarText,),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
  } catch (e) {
    print(e.toString());
  }
}
