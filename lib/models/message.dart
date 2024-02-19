

import 'package:flutter/foundation.dart';

class Message {
  final String text;
  final int timestamp;
  final Uint8List? imageBytes;
  final String type;

  Message(this.text, this.timestamp, this.type, [this.imageBytes]);


Map <String, dynamic> toMap(){
   return {
      'text': text,
      'imageBytes': imageBytes,
      'timestamp': timestamp,
      "type" : type
    };
  }}