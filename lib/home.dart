
import 'dart:typed_data';

import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img_extractor/widgets/error_message.dart';
import 'package:img_extractor/widgets/image_display.dart';
import 'package:img_extractor/widgets/metadata_display.dart';
import 'package:img_extractor/widgets/placeholder_message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? _imageBytes; // Store image bytes instead of File
  Map<String, IfdTag>? _metadata;
  String _errorMessage = '';

  Future<void> _pickImage() async {
    setState(() {
      _imageBytes = null; // Reset image bytes
      _metadata = null;
      _errorMessage = '';
    });

    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Read bytes directly from XFile, works on web and mobile
        final imageBytes = await pickedFile.readAsBytes();
        final data = await readExifFromBytes(imageBytes);

        setState(() {
          _imageBytes = imageBytes; // Store bytes
          if (data.isEmpty) {
            _errorMessage = 'No EXIF data found in this image.';
            _metadata = null;
          } else {
            _metadata = data;
            _errorMessage = '';
          }
        });
      } else {
        setState(() {
          _errorMessage = 'No image selected.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error picking image or reading metadata: $e';
        _imageBytes = null; // Reset image bytes
        _metadata = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Display Image if available
              if (_imageBytes != null) ImageDisplay(imageBytes: _imageBytes!),

              // Display Error if exists
              // ErrorMessage widget now handles both general errors and 'No EXIF data' message
              if (_errorMessage.isNotEmpty)
                ErrorMessage(errorMessage: _errorMessage),

              // Display Metadata if available and no error
              if (_metadata != null && _errorMessage.isEmpty)
                MetadataDisplay(metadata: _metadata!),

              // Display Placeholder if no image selected and no error
              if (_imageBytes == null && _errorMessage.isEmpty)
                const PlaceholderMessage(),

              const SizedBox(
                height: 80,
              ), // Add space before FAB overlaps content
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        icon: const Icon(Icons.add_a_photo),
        label: const Text('Pick Image'), // Add label to FAB
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Center FAB
    );
  }
}
