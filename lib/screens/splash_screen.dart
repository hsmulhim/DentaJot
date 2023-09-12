import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dental_proj/auth/app.dart';
import 'package:dental_proj/constants/spacings.dart';
import 'package:dental_proj/extensions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          const SizedBox(
            height: 134,
          ),
          SizedBox(
            height: 200,
            width: context.getWidth() - 50,
            child: Lottie.asset(
              'assets/images/animation_tooth.json',
            ),
          ),
          kHSpace32,
          Container(
            margin: const EdgeInsets.all(8),
            width: context.getWidth() - 80,
            height: 120,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Be',
                  style: TextStyle(fontSize: 22.0),
                ),
                kHSpace16,
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Horizon',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('AWESOME'),
                      RotateAnimatedText('OPTIMISTIC'),
                      RotateAnimatedText('DIFFERENT'),
                    ],
                  ),
                ),
                kHSpace8,
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.lightBlue,
      nextScreen: const App(),
      splashIconSize: 500,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 3),
      centered: true,
    );
  }
}
