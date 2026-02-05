import 'package:bookly/core/routes/app_router.dart';
import 'package:bookly/core/utils/app_colors.dart';
import 'package:bookly/core/widgets/loading_indicator.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    navigateToHome();
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
          const Spacer(),
          SlidingLogo(slidingAnimation: slidingAnimation),
          const Spacer(),
          const LoadingIndicator(),
          const SizedBox(height: 40),
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

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      return GoRouter.of(context).go(AppRouter.kHomeView);
    });
  }
}
