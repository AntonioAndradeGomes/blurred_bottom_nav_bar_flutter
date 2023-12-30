import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ItemPage extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final bool isSelected;
  const ItemPage({
    super.key,
    required this.icon,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Icon(
        icon,
        color: isSelected ? Colors.amber : Colors.white,
        size: 30,
      ),
    );
  }
}
