import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apis/conn_api.dart';
import 'dart:convert';
import '../../UserPref.dart';
import 'package:http/http.dart' as http;
import '../../UserPref.dart';
import '../../theme/text_theme.dart';

_saveRememberMe() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool _rememberMe = prefs.getBool('rememberMe') ?? false;
  if (_rememberMe) {
    prefs.setString('email',user!.email);
    prefs.setString('password',user!.password);
  }
}
updateUser(BuildContext context, TextEditingController nameController,TextEditingController emailController, TextEditingController passwordController) async {
  final tt = CustomTextTheme();
  try {
    var res = await http.post(
      Uri.parse(API.updateUser),
      body: {
        'id': user?.Id.toString(),
        'Name': nameController.text.trim(),
        'Email': emailController.text.trim(),
        'Password': passwordController.text.trim(),
      },
    );
    if(res.statusCode == 200){
      var resBody = jsonDecode(res.body);
      if(resBody['response']){
        SnackBar snackBar = SnackBar(content: Text('Information updated successfully!.',style: tt.snackbarText,),backgroundColor: Colors.lightGreen,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        user?.name = nameController.text;
        user?.email = emailController.text;
        _saveRememberMe();
      }
      else{
        SnackBar snackBar = SnackBar(content: Text('Sorry there was a problem updating your information. Try Again Later!',style: tt.snackbarText,),backgroundColor: Colors.redAccent,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  } catch (e) {
    print(e.toString());
  }
}