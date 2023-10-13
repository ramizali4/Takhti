import 'package:flutter/material.dart';
import '../theme/text_theme.dart';
import '../theme/color_theme.dart';

class Screen5 extends StatefulWidget {
  final BuildContext bCnt;

  Screen5(this.bCnt);

  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  final tt = CustomTextTheme();
  final nC = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late BuildContext bCnt;
  bool _rememberMe = false;
  late double scr;

  @override
  void initState() {
    super.initState();
    scr = 0.0;
  }
  @override
  Widget build(BuildContext context) {
    scr = MediaQuery.of(context).size.width;
    nameController.text = "test";
    nC.text = "user";
    emailController.text ="test@email.com";
    passwordController.text = "";
    return Scaffold(
      backgroundColor: AppColorsLight.bgColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Image(image: AssetImage('assets/user.png'),
                      width: scr>400 ? 450:null,),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0,top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              nC.text,
                              style: tt.titleLargeBG
                          ),
                          Text(
                              emailController.text,
                              style: tt.bodyBG
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorsLight.bgColor,
                        maximumSize: Size(500, 50),
                        // add outline
                        side: BorderSide(width: 0.5, color: AppColorsDark.primaryBlack),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit,color: AppColorsDark.primaryBlack,),
                        Text('Edit Profile',style: tt.titleLargeBG),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 40,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.grey.shade300,
              ),
              Container(alignment: Alignment.centerLeft,child: Text('APP SETTINGS',textAlign: TextAlign.start,style:TextStyle(fontSize: 10,fontFamily: 'OUTFIT',fontWeight: FontWeight.bold, color: Colors.grey.shade500))),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColorsLight.bgColor,
                      maximumSize: Size(500, 50),
                    ),
                    onPressed: () {
                       },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.lock,color: AppColorsDark.primaryBlack,),
                        SizedBox.fromSize(size: Size(10, 0)),
                        Text('Change Password',style: tt.bodyNormal),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColorsLight.bgColor,
                      maximumSize: Size(500, 50),
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.format_size,color: AppColorsDark.primaryBlack,),
                        SizedBox.fromSize(size: Size(10, 0)),
                        Text('Text Size',style: tt.bodyNormal),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColorsLight.bgColor,
                      maximumSize: Size(500, 50),
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.notifications,color: AppColorsDark.primaryBlack,),
                        SizedBox.fromSize(size: Size(10, 0)),
                        Text('Notifications',style: tt.bodyNormal),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 40,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColorsLight.bgColor,
                      maximumSize: Size(500, 50),
                    ),
                    onPressed: () {
                      //clear recent naivgation and anvigator .pushnamed login
                      Navigator.pushNamed(widget.bCnt, '/login');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.logout,color: AppColorsDark.primaryGold,),
                        SizedBox.fromSize(size: Size(10, 0)),
                        Text('Log out',style: tt.bodyNormalG),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                  onTap: () {
                    // showDeleteAccountConfirmationDialog(context);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColorsLight.bgColor,
                        maximumSize: Size(500, 50),
                      ),
                      onPressed: () {
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.delete,color: Colors.redAccent,),
                          SizedBox.fromSize(size: Size(10, 0)),
                          Text('Delete Account',style: tt.bodyNormalR),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

