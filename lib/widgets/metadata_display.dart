import 'package:flutter/material.dart';
import 'package:exif/exif.dart';
import '../utils/exif_helpers.dart'; // Import helpers

class MetadataDisplay extends StatelessWidget {
  final Map<String, IfdTag> metadata;

  const MetadataDisplay({super.key, required this.metadata});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Image Metadata (EXIF):',
                  style: Theme.of(context).textTheme.titleLarge, // Larger title
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  tooltip: 'What is EXIF Metadata?',
                  onPressed:
                      () => showMetadataDescriptionDialog(
                        // Use the helper function
                        context,
                        'What is EXIF Metadata?',
                        'EXIF (Exchangeable image file format) data is information stored within an image file. It often includes details like camera settings (shutter speed, aperture, ISO), date/time taken, camera model, and sometimes GPS location.',
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: metadata.length,
              itemBuilder: (context, index) {
                String key = metadata.keys.elementAt(index);
                IfdTag? value = metadata[key];
                String description =
                    exifDescriptions[key] ?? // Use helper map
                    'No description available for this tag.';

                return ListTile(
                  dense: true,
                  title: Text(
                    key,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(value?.toString() ?? 'N/A'),
                  trailing: IconButton(
                    icon: const Icon(Icons.help_outline, size: 18.0),
                    tooltip: 'Show description',
                    onPressed:
                        () => showMetadataDescriptionDialog(
                          // Use the helper function
                          context,
                          key,
                          description,
                        ),
                  ),
                  onTap:
                      () => showMetadataDescriptionDialog(
                        // Use the helper function
                        context,
                        key,
                        description,
                      ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
