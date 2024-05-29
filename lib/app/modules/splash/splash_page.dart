import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              width: 260.0,
              height: 100,
            ),
          ),
          Center(
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45.0,
                  fontFamily: 'Agne',
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  totalRepeatCount: 10,
                  isRepeatingAnimation: false,
                  onFinished: () => Modular.to.pushReplacementNamed('/home'),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'LibrasCode',
                      speed: const Duration(milliseconds: 150),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // body: Stack(
      //   children: [
      //     Center(
      //       child: Container(
      //         color: Colors.blue,
      //         width: 250.0,
      //         height: 100,
      //       ),
      //     ),
      //     Center(
      //       child: SizedBox(
      //         width: 250.0,
      //         child: DefaultTextStyle(
      //           style: const TextStyle(
      //             color: Colors.white,
      //             fontSize: 70.0,
      //             fontFamily: 'Canterbury',
      //             fontWeight: FontWeight.bold,
      //           ),
      //           child: AnimatedTextKit(
      //             animatedTexts: [
      //               ScaleAnimatedText('Libras'),
      //               ScaleAnimatedText('Code'),
      //             ],
      //             onTap: () {
      //               print("Tap Event");
      //             },
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // body: Center(
      //   child: SizedBox(
      //     width: 250.0,
      //     child: DefaultTextStyle(
      //       style: const TextStyle(
      //         color: Colors.black,
      //         fontSize: 45.0,
      //         fontFamily: 'Agne',
      //         fontWeight: FontWeight.bold,
      //       ),
      //       child: AnimatedTextKit(
      //         totalRepeatCount: 10,
      //         isRepeatingAnimation: false,
      //         onFinished: () => Modular.to.pushReplacementNamed('/home'),
      //         animatedTexts: [
      //           TypewriterAnimatedText('LibrasCode'),
      //         ],
      //         onTap: () {
      //           print("Tap Event");
      //         },
      //       ),
      //     ),
      //   ),
    );
  }
}
