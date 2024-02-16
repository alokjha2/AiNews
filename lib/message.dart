

import 'package:flutter/foundation.dart';

class Message {
  final String text;
  final int timestamp;
  final Uint8List? imageBytes;

  Message(this.text, this.timestamp, [this.imageBytes] );


Map <String, dynamic> toMap(){
   return {
      'text': text,
      'imageBytes': imageBytes,
      'timestamp': timestamp,
    };
  }}