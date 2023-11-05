import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:takhti_app/theme/text_theme.dart';
import 'package:takhti_app/theme/color_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Future<void> setFirst() async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //      prefs.setBool('first_time', false).then((bool success) {
  //       return print('done setting app shared pref');
  //     });
  //   });
  // }
   _onIntroEnd(context) async {
    // await setFirst();
    Navigator.pushNamed(context, 'login');
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = CustomTextTheme();


    var pageDecoration = PageDecoration(
      titleTextStyle: textTheme.introTitle,
      bodyTextStyle: textTheme.introBody,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 0.0),
      pageColor: AppColorsDark.primaryBlack,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColorsDark.primaryBlack,
      allowImplicitScrolling: true,
      autoScrollDuration: 10000,
      infiniteAutoScroll: true,
      globalFooter: Container(
        width: MediaQuery.of(context).size.width>500? 500 : MediaQuery.of(context).size.width,
        height: 80,
        decoration: const BoxDecoration(
          color: AppColorsDark.primaryBlack,
        ),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColorsDark.primaryBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              child:const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Let\'s Get Started!',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(alignment: Alignment.centerRight,child: Icon(Icons.arrow_forward_rounded,weight: 600,color: AppColorsDark.primaryBlack,)),
                ],
              ),
              onPressed: () => _onIntroEnd(context),
            ),
          ),
      ),
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
          "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('plan.png'),
          decoration: pageDecoration,

        ),
        PageViewModel(
          title: "Learn as you go",
          body:
          "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage('climbing.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
          "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('idea.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          image: Align(
              alignment: Alignment.bottomCenter,
              child: _buildImage('todo.png')
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        PageViewModel(
          title: "Title of last page - reversed",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click on ", style: textTheme.introBody),
              const Icon(Icons.edit,color: Colors.white,),
              Text(" to edit a post", style: textTheme.introBody),
            ],
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('message.png'),
          reverse: true,
        ),
      ],
      onDone: () => {},
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Align(alignment :Alignment.topLeft,child: Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),)),
      next: const Icon(Icons.arrow_forward,color: Colors.white,),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.transparent)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeColor: AppColorsDark.primaryGold,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

