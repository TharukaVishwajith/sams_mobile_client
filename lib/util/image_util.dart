import 'dart:ui';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

class ImageUtil {
  Image imageFromBase64String(String? base64String) {
    if (base64String == null || base64String == "") return Image.asset('assets/images/no_image.png');
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}