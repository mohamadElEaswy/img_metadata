import 'package:flutter/material.dart';

// Map of common EXIF tags to their descriptions
const Map<String, String> exifDescriptions = {
  'Image Make': 'The manufacturer of the camera or input device.',
  'Image Model': 'The model name or number of the camera or input device.',
  'Image Orientation':
      'The orientation of the image with respect to the scene.',
  'Image XResolution':
      'The number of pixels per resolution unit in the image width direction.',
  'Image YResolution':
      'The number of pixels per resolution unit in the image height direction.',
  'Image ResolutionUnit':
      'The unit for XResolution and YResolution (e.g., inches, centimeters).',
  'Image Software':
      'The name and version of the software used to create the image.',
  'Image DateTime': 'The date and time the image file was last changed.',
  'EXIF ExifVersion': 'The version of the EXIF standard.',
  'EXIF DateTimeOriginal':
      'The date and time when the original image data was generated.',
  'EXIF DateTimeDigitized':
      'The date and time when the image was stored as digital data.',
  'EXIF ComponentsConfiguration':
      'Information about the channels of each component (e.g., YCbCr).',
  'EXIF CompressedBitsPerPixel':
      'The compression mode used for a compressed image.',
  'EXIF ExposureTime': 'The time the camera shutter was open, in seconds.',
  'EXIF FNumber':
      'The F-number (aperture value) of the lens when the image was taken.',
  'EXIF ExposureProgram':
      'The class of the program used by the camera to set exposure.',
  'EXIF ISOSpeedRatings': 'The ISO speed of the camera sensor.',
  'EXIF ShutterSpeedValue': 'The shutter speed.',
  'EXIF ApertureValue': 'The lens aperture.',
  'EXIF BrightnessValue': 'The brightness value.',
  'EXIF ExposureBiasValue': 'The exposure bias.',
  'EXIF MaxApertureValue': 'The smallest F-number of the lens.',
  'EXIF MeteringMode':
      'The metering mode (e.g., Average, CenterWeightedAverage, Spot).',
  'EXIF Flash': 'Indicates the status of the flash when the image was shot.',
  'EXIF FocalLength': 'The focal length of the lens, in millimeters.',
  'EXIF ColorSpace': 'The color space information.',
  'EXIF PixelXDimension': 'The valid width of the meaningful image.',
  'EXIF PixelYDimension': 'The valid height of the meaningful image.',
  'EXIF FocalPlaneXResolution': 'Number of pixels in the focal plane width.',
  'EXIF FocalPlaneYResolution': 'Number of pixels in the focal plane height.',
  'EXIF FocalPlaneResolutionUnit':
      'Unit for FocalPlaneXResolution and FocalPlaneYResolution.',
  'EXIF SensingMethod': 'The type of image sensor.',
  'EXIF FileSource': 'Indicates the image source.',
  'EXIF SceneType': 'Indicates the type of scene.',
  'GPS GPSLatitudeRef': 'Indicates whether the latitude is north or south.',
  'GPS GPSLatitude': 'The latitude.',
  'GPS GPSLongitudeRef': 'Indicates whether the longitude is east or west.',
  'GPS GPSLongitude': 'The longitude.',
  'GPS GPSAltitudeRef': 'Indicates the reference altitude used.',
  'GPS GPSAltitude': 'The altitude based on the reference.',
  'GPS GPSTimeStamp': 'The time as UTC (Coordinated Universal Time).',
  'GPS GPSSpeedRef':
      'The unit used to express the GPS receiver speed of movement.',
  'GPS GPSSpeed': 'The speed of GPS receiver movement.',
  'GPS GPSImgDirectionRef':
      'The reference for giving the direction of the image.',
  'GPS GPSImgDirection': 'The direction of the image when it was captured.',
  'GPS GPSDateStamp': 'The GPS date.',
  // Add more descriptions as needed
};

// Helper method to show metadata description
void showMetadataDescriptionDialog(
  BuildContext context,
  String tag,
  String description,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(tag),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
