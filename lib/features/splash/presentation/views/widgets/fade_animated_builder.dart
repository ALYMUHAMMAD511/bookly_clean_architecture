import 'package:bookly_ebook_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FadeAnimatedBuilder extends StatelessWidget {
  const FadeAnimatedBuilder({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (context, _)
      {
        return FadeTransition(
          opacity: fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(Assets.logo),
              const Text(
                'Explore & Read Free Books',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
