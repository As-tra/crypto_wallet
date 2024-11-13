import 'dart:math';
import 'package:flutter/material.dart';
import 'package:particles_flutter/component/particle/particle.dart';

List<Particle> generateParticles() {
  final List<Particle> particles = [];
  final Random random = Random();

  for (int i = 0; i < 50; i++) {
    final double velocityX = (random.nextDouble() * 100 - 50);
    final double velocityY = (random.nextDouble() * 100 - 50);

    particles.add(
      Particle(
        color: const Color(0xffF0F0F0),
        size: 4,
        velocity: Offset(velocityX, velocityY),
      ),
    );
  }

  return particles;
}
