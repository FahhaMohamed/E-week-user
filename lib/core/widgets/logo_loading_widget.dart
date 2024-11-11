import 'dart:math';
import 'package:flutter/material.dart';
import 'package:user/core/widgets/logo.dart';

class LogoLoadingWidget extends StatefulWidget {
  final double width;
  const LogoLoadingWidget({super.key, required this.width});

  @override
  // ignore: library_private_types_in_public_api
  _LogoLoadingWidgetState createState() => _LogoLoadingWidgetState();
}

class _LogoLoadingWidgetState extends State<LogoLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(); // This repeats the animation continuously
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(
              _controller.value * 5 * pi), // Rotating along Y axis
          child: child,
        );
      },
      child: ourLogo(size: widget.width),
    );
  }
}
