

import 'package:flutter/foundation.dart';

class Message {
  final String text;
  final Uint8List? imageBytes;

  Message(this.text, [this.imageBytes]);
}
