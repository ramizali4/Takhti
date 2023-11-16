import 'dart:convert';

import '../apis/conn_api.dart';
import '../models/user.dart';
import 'package:takhti_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

registerUser(BuildContext context, TextEditingController _nameController, TextEditingController _emailController, TextEditingController _passwordController, TextEditingController _confirmPasswordController) async {
  User usermodel = User(1, _nameController.text.trim(), _emailController.text.trim(), _passwordController.text.trim());
  CustomTextTheme tt = CustomTextTheme();
  try{
    var res = await http.post(
        Uri.parse(API.signup),
        body: usermodel.toJson()
    );
    if(res.statusCode == 200){
      var resBody = jsonDecode(res.body);
      if(resBody['response']){
        SnackBar snackBar = SnackBar(content: Text('Congratulations! You have signed up successfully.',style: tt.snackbarText,),backgroundColor: Colors.lightGreen,);
        _nameController.text = '';
        _emailController.text = '';
        _passwordController.text = '';
        _confirmPasswordController.text = '';
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      }
      else{
        SnackBar snackBar = SnackBar(content: Text('User registration failed!',style: tt.snackbarText,),backgroundColor: Colors.redAccent,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    else{
      SnackBar snackBar = SnackBar(content: Text('Something went wrong. Try again!\n Error code: ${res.statusCode}',style: tt.snackbarText,),backgroundColor: Colors.redAccent,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  catch(e){
    print(e.toString());
  }
}