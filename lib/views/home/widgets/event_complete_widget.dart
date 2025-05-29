import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class EventCompleteWideget extends StatelessWidget {
  const EventCompleteWideget({
    super.key,
    required ConfettiController confettiController,
  }) : _confettiController = confettiController;

  final ConfettiController _confettiController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _confettiController,
        blastDirection: -3.14 / 2,
        emissionFrequency: 0.06,
        numberOfParticles: 20,
        maxBlastForce: 10,
        minBlastForce: 5,
        gravity: 0.1,
        shouldLoop: true, 
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple,
        ],
      ),
    );
  }
}