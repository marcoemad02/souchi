import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';

import '../../../versionCheck/app_general_state.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation; // Use double animation for opacity

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Faster fade animation (1 second)
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(animationController); // Create opacity animation

    animationController.forward();
    Future.delayed(
      const Duration(seconds: 1),
          () {
        // fetchUpdate();
      },
    );
    Future.delayed(
      const Duration(seconds: 2),
          () {
        appGeneralState();
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
            height: 170, child: Image.asset('assets/image/SplashLogo.png')),
        const SizedBox(
          height: 32,
        ),
        AnimatedBuilder(
          animation: fadeAnimation,
          builder: (context, _) {
            return Opacity(
              opacity: fadeAnimation.value,
              child: const Text(
                'So She Picks ',
                textAlign: TextAlign.center,
                style: Styles.textStyle30orange,
              ),
            );
          },
        ),
        // Use the LoginCheck widget here
      ],
    );
  }
}
