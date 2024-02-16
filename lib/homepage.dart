




import 'dart:async';
import 'dart:developer';
// import 'dart:ffi';
import 'dart:typed_data';

import 'package:ainews/localdb.dart';
import 'package:ainews/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:sqflite/sqflite.dart';





class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final TextEditingController _textEditingController = TextEditingController();
 bool _isInputEmpty = true;
 final gemini = Gemini.instance;
 List<Message> messages = [

  ];

  Image? selectedImage;
  Uint8List image = Uint8List(0);

   final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // Define your desired padding for different screen sizes
    // You can adjust these values according to your design requirements
    double smallScreenPadding = 16.0;
    double mediumScreenPadding = 32.0;
    double largeScreenPadding = 48.0;

    // Calculate the padding based on screen width
    double paddingValue;
    if (screenSize.width < 600) {
      paddingValue = smallScreenPadding;
    } else if (screenSize.width >= 600 && screenSize.width < 1200) {
      paddingValue = mediumScreenPadding;
    } else {
      paddingValue = largeScreenPadding;
    }

    // Create EdgeInsets with the calculated padding value
    EdgeInsets padding = EdgeInsets.all(paddingValue);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      drawer: Drawer(),
      body: 
        Padding(
          padding: padding,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.grey[200], // Background color
                ),
              ),

              Align(
                alignment: Alignment.topCenter,
                child: Container(

                  child: Column(
                    // controller: _scrollController,
                    children: [
                      Expanded(
                                  child: ListView.builder(
                                    itemCount: messages.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      Message message = messages[index];

                                      return _buildChatMessage(message);
                                          
                                    },
                                  ),
                                ),
                    ],
                  ),


                ),
              ),
              Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onSubmitted: (value) {
                          _isInputEmpty ? null : _sendMessage;
                          setState(() {
                            _isInputEmpty = value.isEmpty;
                          });
                        },
                        controller: _textEditingController,
                        onChanged: (value) {
                          setState(() {
                            _isInputEmpty = value.isEmpty;
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                             image.isNotEmpty
                              ? SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.memory(image),
                                )
                              : IconButton(
                                  onPressed: getImageBytes,
                                  icon: Icon(Icons.image),
                                ),


                              IconButton(
                                onPressed: _isInputEmpty ? null : _sendMessage,
                                icon: Icon(Icons.send),
                                color: _isInputEmpty ? Colors.grey : Colors.black,
                              ),
                            ],
                          ),
                          hintText: 'Enter your news here',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
          ),
      )
    );
  }

  Widget _buildChatMessage(Message message) {
  return Container(
    padding: EdgeInsets.all(8.0),
    margin: EdgeInsets.symmetric(vertical: 4.0),
    decoration: BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: ListTile(
      // isThreeLine: true,
      title: Text(
        message.text,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: message.imageBytes != null
          ? Container(
            alignment: Alignment.centerLeft,
              height: 100,
              width: 100,
              child: Image.memory(message.imageBytes!),
            )
          : null,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
        ),
        child: InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: message.text)).then((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Copied to your clipboard!')),
              );
            });
          },
          borderRadius: BorderRadius.circular(20),
          child: Icon(
            Icons.content_paste,
            color: Colors.grey[600],
          ),
        ),
      ),
    ),
  );
}


  Future<Uint8List?> getImageBytes() async {
  final pickedFile = await ImagePickerWeb.getImageAsBytes();

  if (pickedFile != null) {
    setState(() {
      image = pickedFile;
    });
    return pickedFile;
  }

  return null;
}

 void _sendMessage() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  String userInput = _textEditingController.text;
  DatabaseHelper.insertMessage(Message(userInput, timestamp));
  
  // Check if the image is empty
  if (image.isNotEmpty) {
    messages.add(Message("You: $userInput", timestamp, image));
  } else {
    messages.add(Message("You: $userInput", timestamp)); // Add message without image
  }
  
  _textEditingController.clear();
  setState(() {
    _isInputEmpty = true;
  });

  gemini.streamGenerateContent(userInput, images: [image]).listen(
    (value) {
      // Update UI with AI response
      setState(() {
        messages.add(Message("AI: ${value.output}", timestamp));
        // image.clear();
      });
    },
    onError: (e) {
      setState(() {
        messages.add(Message("AI: ${e} ", timestamp));
      });
    },
  );
}

}
