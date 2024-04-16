import 'package:ainews/screens/homePage/homepage.dart';
import 'package:ainews/screens/landing_page/how_it_works.dart';
import 'package:ainews/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:ainews/services/responsiveness.dart';
import 'nav_item.dart'; // Import your home page file
import 'package:ainews/import.dart' as a;

class Header extends StatefulWidget {
  final controller;
  final HowItWorks;

  const Header({this.HowItWorks, this.controller});
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  late BoxDecoration containerDecoration;
  late Color textColor;
  //  final ScrollController scrollController = ScrollController();

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
    // final contextValue = context;

 
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Conditionally render different image sizes based on device type
          if (!isMobile(context))
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
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

                    InkWell(
      splashColor: Colors.transparent,
      onTap: (){
      if (widget.HowItWorks != null) {
  Scrollable.ensureVisible(
    widget.HowItWorks.currentContext!,
    alignment: 0.0,
    duration: Duration(milliseconds: 600),
    curve: Curves.easeInOut,
  );
}

      },
      highlightColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          "How it works",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            // color: 
            
            // color == null ?
            // kTextColor : color
          ),
        ),
      ),
    ),
                    NavItem(
                      title: 'How it works',
                      tapEvent: () =>
                        Scrollable.ensureVisible(
               widget. HowItWorks.currentContext!,
                alignment: 0.0,
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOut,
              ),
        //                 Scrollable.ensureVisible(
                          
        //   widget.HowItWorks.contextValue,
        //   duration: Duration(milliseconds: 600),
        //   curve: Curves.decelerate,
        // );

              //           widget.controller.animateTo(
              //   // Define the scroll position for the 'Product' section
              //   1000, // Example: Scroll to 500 pixels
              //   duration: Duration(milliseconds: 600),
              //   curve: Curves.decelerate,
              // );
          // },
        
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
