import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:his_mobile/core/routes/app_router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer? timer;
  AnimationController? _animationController;
  Animation<double>? _fadeInAnimation;

  void _startExitAnimation() {
    _animationController!.reverse().then((_) {
      if (mounted) {
        context.router.replace(const HomeRoute());
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Animation duration
    );

    _fadeInAnimation =
        Tween(begin: 0.0, end: 0.5).animate(_animationController!);

    _animationController!.forward().then((_) {
      Future.delayed(const Duration(seconds: 1), () {
        _startExitAnimation();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInAnimation!,
      child: Stack(
        children: [
          Image.asset(
            'assets/splash_screen.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
