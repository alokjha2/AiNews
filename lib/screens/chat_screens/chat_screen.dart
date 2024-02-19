import 'package:ainews/import.dart';
import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

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

  // final ThemeController _themeController = Get.find();

final StabilityAI _ai = StabilityAI();


  // final _creator = GlobalKey();
  @override
  Widget build(BuildContext context) {
    
    Size screenSize = MediaQuery.of(context).size;

    // Define your desired padding for different screen sizes
    // You can adjust these values according to your design requirements
    double smallScreenPadding = 32.0;
    double mediumScreenPadding = 64.0;
    double largeScreenPadding = 64.0;

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
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,

      child: Padding(
          padding: padding,
          child: Stack(
            children: [

              Align(
                alignment: Alignment.topCenter,
                child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: messages.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      Message message = messages[index];
                                      
                                
                                      return buildChatMessage(message);
                                          
                                    },
                                  ),
                                ),
                    ],
                  
                                
                                
                ),
              ),


              Container(
                child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(

                    maxLines: 7,
                    minLines: 1,
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
                      suffixIconConstraints: BoxConstraints(
                        minHeight: 32, // Adjust this value as needed
                        minWidth: 32, // Adjust this value as needed
                      ),
                      suffixIcon:
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Tooltip(
                              message: "Select Image",
                              child: InkWell(
                                onTap: () {
                                  // Call getImageBytes function to pick images
                                  getImageBytes();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    color: Colors.grey,
                                    border: Border.all(
                                      color: Colors.black, // Set the color of the border
                                      width: 1.0, // Set the width of the border
                                    ),
                                  ),
                                  // Use a conditional expression to decide whether to show the image or the icon
                                  child: image.isNotEmpty
                                      ? Image.memory(
                                          image,
                                          fit: BoxFit.cover, // Adjust the BoxFit property as needed
                                          alignment: Alignment.center, // Center the image inside the container
                                        )
                                      : Center(
                                          child: Icon(
                                            Icons.image,
                                            color: Colors.white,
                                            size: 20, // Adjust the size of the icon as needed
                                          ),
                                        ),
                                ),
                              ),
                            ),


SizedBox(width: 3,),


                            
                            Tooltip(
                              message: "Send Input",
                              child: InkWell(
                                onTap: (){
                                  // _sendMessage();
                                  if (!_isInputEmpty) {
                                    _sendMessage();}
                                                       
                                },
                                child: Container(
                                
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)
                                    ),
                                    color: 
                                    _isInputEmpty ? Colors.grey : Colors.black,
                                    ),
                                  child: Center(
                                    child: Icon(
                                      // onPressed: 
                                      Icons.send,
                                      color: Colors.white, 
                                      size: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                                               ),
                       ),
                      hintText: 'Enter here',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12,),
                      ),
                    ),
                  ),
                ),
                            ),
              ),
          ],
          ),
      ),
      // height: 300,
      // color: Colors.green,
    );
    // Your home section widget implementation
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

// void _generate() async {
//     /// Call the generateImage method with the required parameters.
//     Uint8List image = await _ai.generateImage(
//       apiKey: "sk-uUpEz4XRixa4FlRSt4Bf35gWyEMvPNCoFU723nQ6mboVf0lO",
//       imageAIStyle: ImageAIStyle.anime,
//       prompt: _textEditingController.text,
//     );
//     messages.add(Message("", 0, image));
//     // return image;
//   }

 void _sendMessage() {
  int timestamp = DateTime.now().millisecondsSinceEpoch;
  String userInput = _textEditingController.text;
  // DatabaseHelper.insertMessage(Message(userInput, timestamp));

  // Check if the image is empty
  if (image.isNotEmpty) {
    messages.add(Message("$userInput", timestamp,"user", image));
    _textEditingController.clear();
    setState(() {
      _isInputEmpty = true;
    });

    // Call gemini.streamGenerateContent only if the image is not empty
    gemini.streamGenerateContent(userInput, images: [image]).listen(
      (value) {
        // Update UI with AI response
        setState(() {
          messages.add(Message("${value.output}", timestamp, "AI"));
        });
      },
      onError: (e) {
        setState(() {
          messages.add(Message("${e} ", timestamp, "AI"));
        });
      },
    );
  } else {
    // If the image is empty, just add the user message without calling gemini.streamGenerateContent
    messages.add(Message("$userInput", timestamp,"user"));
    _textEditingController.clear();
    setState(() {
      _isInputEmpty = true;
    });
  }
   gemini.streamGenerateContent(userInput).listen(

    (value) {
      // Future.delayed(Duration(seconds: 1));


        // Update UI with AI response
        setState(() {
          messages.add(Message("${value.output}", timestamp, "AI"));
        });
      },
      onError: (e) {
        setState(() {
          messages.add(Message("${e} ", timestamp, "AI"));
        });
      },
    );
}






_chat(){

  gemini.chat(messages.cast<Content>());
}

}