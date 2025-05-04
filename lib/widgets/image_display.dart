import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final Uint8List imageBytes;

  const ImageDisplay({super.key, required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Increased padding
        child: Column(
          children: [
            Text(
              'Selected Image:',
              style: Theme.of(context).textTheme.titleLarge, // Larger title
            ),
            const SizedBox(height: 12.0),
            ClipRRect(
              // Add rounded corners to the image
              borderRadius: BorderRadius.circular(8.0),
              child: Image.memory(
                imageBytes,
                height: 250,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) => const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Text('Could not display image'),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
