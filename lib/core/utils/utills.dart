import 'dart:convert';
import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String?> getImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Read the file as bytes
      final bytes = await pickedFile.readAsBytes();

      // Encode the bytes as base64 string
      final base64String = base64Encode(bytes);
      log('base64String created: $base64String');
      return base64String;
    }
    Exception('No image selected');
    return null;
  }
}
