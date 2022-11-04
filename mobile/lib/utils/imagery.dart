import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class Imagery {
  /// compress image file
  static Future<File> compressFile(File input) async {
    if (input.absolute.path.startsWith('http') || input.path.isEmpty) {
      return input;
    }
    var targetPath = await getApplicationDocumentsDirectory();
    return (await FlutterImageCompress.compressAndGetFile(input.absolute.path,
            '${targetPath.absolute.path}/${DateTime.now().millisecondsSinceEpoch}.jpg',
            quality: 75, minWidth: 512, minHeight: 512)) ??
        input;
  }
}
