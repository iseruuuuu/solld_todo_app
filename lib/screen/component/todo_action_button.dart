import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;

  const ActionButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize: const Size(150, 50),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }
}
