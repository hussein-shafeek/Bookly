import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/widgets/loading_indicator.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_logo.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    //navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlidingLogo(slidingAnimation: slidingAnimation),
          // const LoadingIndicator(),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, -20),
      end: const Offset(0, 0),
    ).animate(animationController);
    animationController.forward();
  }

  // void navigateToHome() {
  //   Future.delayed(const Duration(seconds: 3)).then((value) {
  //     // return Navigator.pushReplacementNamed(context, Routes.homeView);
  //   });
  // }
}
