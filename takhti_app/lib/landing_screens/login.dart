import 'package:flutter/material.dart';
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
                Title(color: AppColorsDark.primaryBlack, child: Text('Let\'s Login', style: tt.titleLarge)),
                const SizedBox(height: 16.0),
                Title(color: AppColorsDark.primaryBlack, child: Text('And start your journey', style: tt.bodyText1)),
                const SizedBox(height: 50.0),
                Title(color: AppColorsDark.primaryBlack, child: Text('Email Address', style: tt.bodyText1)),
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
                Title(color: AppColorsDark.primaryBlack, child: Text('Password', style: tt.bodyText1)),
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
                Title(color: AppColorsDark.primaryBlack, child: Text('Forgot Password?', style: TextStyle(color: Colors.black, fontSize: 14))),
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
                    onPressed: () {
                      if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
                        SnackBar snackBar = SnackBar(
                          content: Text('Please fill all the fields!', style: tt.snackbarText,),
                          backgroundColor: Colors.redAccent,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }
                    },
                    child: Text('Login', style: tt.introBody,),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member yet?', style: tt.caption),
                      TextButton(
                        onPressed: () {
                          if (_emailController.text.trim().isNotEmpty || _passwordController.text.trim().isNotEmpty) {
                            _emailController.text = '';
                            _passwordController.text = '';
                          }
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text('Register Here', style: tt.captionLink,),
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
