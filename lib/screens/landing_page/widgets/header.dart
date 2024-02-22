import 'package:ainews/screens/homePage/homepage.dart';
import 'package:ainews/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:ainews/services/responsiveness.dart';
import 'nav_item.dart'; // Import your home page file
import 'package:ainews/import.dart' as a;

class Header extends StatefulWidget {
  final controller;

  const Header({super.key, this.controller});
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  late BoxDecoration containerDecoration;
  late Color textColor;

  @override
  void initState() {
    super.initState();
    containerDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: Colors.white54, // Border color
        width: 1.0,            // Border width
      ),
    );
    textColor = Colors.white; // Initial text color
  }

  // Add more keys for additional sections as needed
  @override
  Widget build(BuildContext context) {
 
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Conditionally render different image sizes based on device type
          if (!isMobile(context))
            InkWell(
              onTap: (){
                widget.controller.animateTo(
            0.0, // Scroll to the top
            duration: Duration(milliseconds: 600), // Optional: Animation duration
            curve: Curves.decelerate, // Optional: Animation curve
          );
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  image:  DecorationImage(
                    image: AssetImage('assets/Ai.png'), // Replace 'assets/image.jpg' with your image path
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),),
                // child: Image.asset('assets/Ai.png'),
              ),
            )
          else
            Container(
              width: 50,
              height: 50,
              child: Image.asset('assets/Ai.png'),
            ),
          SizedBox(width: 10),
          if (!isMobile(context))
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent, // Transparent color at the top
      Colors.white.withOpacity(0.1), // Light shade of white in the middle
      Colors.transparent, // Transparent color at the bottom
    ],
  ),
                
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
      color: Colors.white30, // Border color
      width: 1.0,          // Border width
    ),
                  // color: kTextColor
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    NavItem(
                      title: 'Product',
                      tapEvent:
                       () {
                      },
                    ),
                    NavItem(
                      title: 'How it works',
                      tapEvent: () {
          },
        
                    ),
                    NavItem(
                      title: 'Features',
                      tapEvent: () {
                       
                      },
                    ),
                    NavItem(
                      
                      title: 'Creator',
                      tapEvent: () {
                        // print("hello");
                      }
                    ),
                  ],
                ),
              ),
            ),
          // "Check it out" button
          MouseRegion(
  onEnter: (_) {
    setState(() {
      // Update the container's decoration when hovered
      containerDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white, // Change background color to white
        border: Border.all(
          color: Colors.white54, // Border color
          width: 1.0,            // Border width
        ),
      );
      textColor = Colors.black; // Change text color to black
    });
  },
  onExit: (_) {
    setState(() {
      // Reset the container's decoration when not hovered
      containerDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.white54, // Border color
          width: 1.0,            // Border width
        ),
      );
      textColor = Colors.white; // Reset text color
    });
  },
  child: Container(
    decoration: containerDecoration,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: NavItem(
        title: "Check out",
        color: textColor,
        tapEvent: () {
           Navigator.pushNamed(context, '/HomePage');
        },
      ),
    ),
  ),
),

          if (isMobile(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }

 
}
