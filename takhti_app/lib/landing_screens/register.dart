import 'dart:convert';

import 'package:takhti_app/theme/color_theme.dart';
import 'package:takhti_app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  CustomTextTheme tt = CustomTextTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 25.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(color: AppColorsDark.primaryBlack, child: Text('Register',style: tt.titleLarge)),
                const SizedBox(height: 16.0),
                Title(color: AppColorsDark.primaryBlack, child: Text('And start taking notes',style: tt.bodyText1)),
                const SizedBox(height: 30.0),
                Title(color: AppColorsDark.primaryBlack, child: Text('Full Name',style: tt.bodyText1)),
                const SizedBox(height: 6.0),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Kimi no nawa?',
                    hintStyle: tt.subtitle2,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                Title(color: AppColorsDark.primaryBlack, child: Text('Email Address',style: tt.bodyText1)),
                const SizedBox(height: 6.0),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: tt.subtitle2,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                Title(color: AppColorsDark.primaryBlack, child: Text('Password',style: tt.bodyText1)),
                const SizedBox(height: 6.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20.0),
                Title(color: AppColorsDark.primaryBlack, child: Text('Retype Password',style: tt.bodyText1)),
                const SizedBox(height: 6.0),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 36.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorsDark.primaryBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )
                    ),
                    onPressed: () async {
                      if(_passwordController.text == _confirmPasswordController.text
                         && _passwordController.text.isNotEmpty
                         && _confirmPasswordController.text.isNotEmpty
                         && _nameController.text.isNotEmpty
                         && _emailController.text.isNotEmpty){

                      }
                      else{
                        if(_passwordController.text!= _confirmPasswordController.text) {
                            SnackBar snackBar = SnackBar(content: Text('Password does not match',style: tt.snackbarText,),backgroundColor: Colors.redAccent,);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        else{
                          SnackBar snackBar = SnackBar(content: Text('Do not leave any field empty',style: tt.snackbarText,),backgroundColor: Colors.redAccent,);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    child: Text('Register',style: tt.introBody,),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',style: tt.caption),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Login Here',style: tt.captionLink,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
