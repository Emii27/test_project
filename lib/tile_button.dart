import 'package:flutter/material.dart';

import 'animal.dart';

class TileButton extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;

  final double imageSize = 96.0;

  const TileButton({super.key, required this.animal, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(24.0),
        onTap: onTap,
        child: Padding(
          padding: .all(8.0),
          child: Image.asset(
            'assets/images/${animal.name}.png',
            height: imageSize,
            width: imageSize,
          ),
        ),
      ),
    );
  }
}
