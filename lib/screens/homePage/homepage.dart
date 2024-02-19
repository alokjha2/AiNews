import 'package:ainews/screens/chat_screens/chat_screen.dart';
import 'package:ainews/screens/videochat/videochat.dart';
import 'package:ainews/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import your video call screen

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Variable to track the selected item index
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: 
      
      Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2, // Width of the drawer
            child:
            leftDrawer(),
          ),
          Expanded(
            child: _getBody(), // Call a method to get the appropriate body based on the selected item index
          ),
        ],
      ),
    );
  }

  Widget leftDrawer(){
    return Drawer(
        elevation: 1, // Remove elevation to match the app bar
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Container(
                decoration:
                
                // _selectedIndex == 0 ? 
                 BoxDecoration(
                  color: _selectedIndex == 0 ? Colors.grey[300] : null, // Highlight the selected item
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ) ,
                // : null,
                child: ListTile(
                  title: Text('Chat'),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0; // Update the selected item index
                    });
                    
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedIndex == 1 ? Colors.grey[300] : null, // Highlight the selected item
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  // tileColor: Colors.black,
                  title: Text('Video Call'),
                  leading: Image.asset(logo, height: 100, width: 100,),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1; // Update the selected item index
                    });
                    // Navigate or perform logic for chat
                    // Navigator.pop(context); // Close the drawer after navigation
                  },
                ),
              ),
            ),
           
            Divider(),
            ListTile(
              title: Text('Chat History'),
              
            //   Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            //   // Toggle theme logic
            // },
            // child: CircleAvatar(
            //   backgroundColor: Colors.grey.withOpacity(0.5),
            //   child: Get.isDarkMode
            //       ? Icon(Icons.sunny, color: Colors.black)
            //       : Icon(Icons.brightness_2, color: Colors.white),
            // ),
            ),
          ],
        ),
      );
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return ChatScreen();
      case 1:
        return VideoChat(); // Display video call screen for index 1
      case 2:
        return Container(); // Placeholder for chat history screen
      default:
        return Container(); // Placeholder for unknown index
    }
  }
}
