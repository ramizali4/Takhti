import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../UserPref.dart';
import '../../theme/text_theme.dart';
import '../apis/conn_api.dart';

_removeRememberMe() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('rememberMe', false);
  prefs.remove('email');
  prefs.remove('password');
}
deleteUser(BuildContext context) async {
  final tt = CustomTextTheme();
  try {
    var res = await http.post(
      Uri.parse(API.deleteUser),
      body: {
        'id': user?.Id.toString(),
      },
    );
    if(res.statusCode == 200){
      var resBody = jsonDecode(res.body);
      if(resBody['response']){
        SnackBar snackBar = SnackBar(content: Text('Deleted Successfully!.',style: tt.snackbarText,),backgroundColor: Colors.lightGreen,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        user = null;
        _removeRememberMe();
        Navigator.pop(context);
      }
      else{
        SnackBar snackBar = SnackBar(content: Text('Sorry there was a problem deleting your account. Try Again Later!',style: tt.snackbarText,),backgroundColor: Colors.redAccent,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  } catch (e) {
    print(e.toString());
  }
}