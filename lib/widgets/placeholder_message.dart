import 'package:flutter/material.dart';

class PlaceholderMessage extends StatelessWidget {
  const PlaceholderMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
        ), // Add vertical padding
        child: Text(
          'Select an image using the button below to see its metadata.',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.grey[600],
          ), // Subtle color
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
