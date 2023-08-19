
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:souchi/authentication/Screens/login_screen.dart';
import 'package:souchi/styles.dart';



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
        //Get.to(()=>const homePage(),                           ((((هرجع اعدلها تاني بعدين))))
        //transition: Transition.leftToRight,
        //duration: kTranstionDuration);
       // GoRouter.of(context).push('/homePage');
        // there is an error in navigation here ,,, Get.to() Not Get.toNamed
        // Get.toNamed('/Home');
        Get.to(()=>LoginPage());

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
        Container(
            height:170,
            child: Image.asset('assets/image/SplashLogo.png')),
        const SizedBox(
          height:32,
        ),
        AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: slidingAnimation,
                child: const Text(
                  'Souchiii ',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle30orange,
                ),
              );
            })
      ],
    );
  }
}
