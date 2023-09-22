import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';

import '../../../versionCheck/app_general_state.dart'; // Import the LoginCheck widget

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  // add a mixin (animation)
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
    Future.delayed(
      const Duration(seconds: 2),
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

  // fetchUpdate(){
  //    FirebaseFirestore.instance.collection('Update').doc('XikypnOcBgoGUcP60fb8').get().then((value) {
  //      var val=value.get('version');
  //      if(val=="1"){
  //        Get.to(()=>LoginCheck(loggedInWidget: const BranchScreen(), loggedOutWidget: LoginPage()));
  //      }else{
  //        Get.to(()=>LoginCheck(loggedInWidget: const HelpCenter(), loggedOutWidget: LoginPage()));
  //      }
  //    },);
  //
  // }
  //

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
          animation: slidingAnimation,
          builder: (context, _) {
            return SlideTransition(
              position: slidingAnimation,
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
