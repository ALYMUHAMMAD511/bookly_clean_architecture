import 'package:bookly_ebook_app/core/utils/app_router.dart';
import 'package:bookly_ebook_app/features/splash/presentation/views/widgets/fade_animated_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return FadeAnimatedBuilder(fadeAnimation: fadeAnimation);
  }

  void initFadeAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);
  }

  void navigateToHomeView ()
  {
    Future.delayed(
        const Duration(
          seconds: 3,
        ),
            () {
          // ignore: use_build_context_synchronously
          GoRouter.of(context).push(AppRouter.kHomeView);
        });
  }
}
