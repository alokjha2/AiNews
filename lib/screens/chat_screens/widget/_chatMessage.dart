
import 'package:ainews/import.dart';


Widget buildChatMessage(Message message) {
  final isUserMessage = message.type == "user";
  final isAiMessage = message.type == "AI";
  final isLoading = isAiMessage && message.text.isEmpty; // Indicates AI response is loading

  return Align(
    alignment: isUserMessage ? Alignment.topRight : Alignment.topLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isUserMessage ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading) // Show loading indicator if AI response is loading
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            if (message.imageBytes != null)
              Image.memory(
                message.imageBytes!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isUserMessage ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


// LoadingAnimationWidget.twistingDots(
//           leftDotColor: const Color(0xFF1A1A3F),
//           rightDotColor: const Color(0xFFEA3799),
//           size: 200,
//         ),

