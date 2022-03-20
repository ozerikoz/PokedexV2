import 'package:flutter/material.dart';

class PokeballSpinAnimation extends StatefulWidget {
  const PokeballSpinAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<PokeballSpinAnimation> createState() => _PokeballSpinAnimationState();
}

class _PokeballSpinAnimationState extends State<PokeballSpinAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: Image.asset(
          "assets/images/background-pokeball.png",
          cacheWidth: 225,
          opacity: AlwaysStoppedAnimation<double>(0.25),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
