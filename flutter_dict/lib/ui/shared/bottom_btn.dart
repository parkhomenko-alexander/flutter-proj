import 'package:flutter/material.dart';

class RightBottomBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const RightBottomBtn({super.key, required this.onPressed, this.label = ''});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          foregroundColor: Colors.white,
        ),
        child: Text(label),
      ),
    );
  }
}
