import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takhti_app/core/util/checkEmail.dart';
import 'package:takhti_app/core/util/registerUser.dart';

import '../UserPref.dart';
import '../core/util/loginUser.dart';
import '../services/auth_service.dart';
import '../theme/color_theme.dart';
import '../theme/text_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rememberMeKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  CustomTextTheme tt = CustomTextTheme();

  @override
  void initState() {
    super.initState();
    _loadRememberMe();
  }

  _loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _emailController.text = prefs.getString('email') ?? '';
        _passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  _saveRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', _rememberMe);
    if (_rememberMe) {
      prefs.setString('email', _emailController.text.trim());
      prefs.setString('password', _passwordController.text.trim());
    } else {
      prefs.remove('email');
      prefs.remove('password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                    color: AppColorsDark.primaryBlack,
                    child: Text('Let\'s Login', style: tt.titleLarge)),
                const SizedBox(height: 16.0),
                Title(
                    color: AppColorsDark.primaryBlack,
                    child: Text('And start your journey', style: tt.bodyText1)),
                const SizedBox(height: 50.0),
                Title(
                    color: AppColorsDark.primaryBlack,
                    child: Text('Email Address', style: tt.bodyText1)),
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
                Title(
                    color: AppColorsDark.primaryBlack,
                    child: Text('Password', style: tt.bodyText1)),
                const SizedBox(height: 6.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      key: _rememberMeKey,
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    Text('Remember Me', style: tt.bodyText1),
                  ],
                ),
                const SizedBox(height: 16.0),
                Title(
                    color: AppColorsDark.primaryBlack,
                    child: Text('Forgot Password?',
                        style: TextStyle(color: Colors.black, fontSize: 14))),
                const SizedBox(height: 36.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorsDark.primaryBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                    onPressed: () {
                      if (_emailController.text.trim().isEmpty ||
                          _passwordController.text.trim().isEmpty) {
                        SnackBar snackBar = SnackBar(
                          content: Text(
                            'Please fill all the fields!',
                            style: tt.snackbarText,
                          ),
                          backgroundColor: Colors.redAccent,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                      _saveRememberMe(); // Save remember me preference
                      loginUser(context, _emailController, _passwordController);
                    },
                    child: Text(
                      'Login',
                      style: tt.introBody,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(
                          color: AppColorsDark.primaryBlack, width: 2),
                    )),
                    onPressed: () async {
                      await signInWithGoogle();
                      setState(() {});
                      if (checkEmail(context,
                          TextEditingController(text: user?.email ?? ''))) {
                        loginUser(
                            context,
                            TextEditingController(text: user?.email ?? ''),
                            TextEditingController(
                                text: 'jR#9lP5mY2qX\$8oA3sZ7'));
                        print('login new email');
                      } else {
                        registerUser(
                            context,
                            TextEditingController(text: user?.name ?? ''),
                            TextEditingController(text: user?.email ?? ''),
                            TextEditingController(
                                text: 'jR#9lP5mY2qX\$8oA3sZ7'),
                            TextEditingController(
                                text: 'jR#9lP5mY2qX\$8oA3sZ7'));
                        loginUser(
                            context,
                            TextEditingController(text: user?.email ?? ''),
                            TextEditingController(
                                text: 'jR#9lP5mY2qX\$8oA3sZ7'));
                      }
                    },
                    child: Text('Sign In with Google',
                        style: tt.introBody
                            .copyWith(color: AppColorsDark.primaryBlack)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member yet?', style: tt.caption),
                      TextButton(
                        onPressed: () {
                          if (_emailController.text.trim().isNotEmpty ||
                              _passwordController.text.trim().isNotEmpty) {
                            _emailController.text = '';
                            _passwordController.text = '';
                          }
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Register Here',
                          style: tt.captionLink,
                        ),
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
