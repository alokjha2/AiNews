
import 'dart:math';

import 'package:ainews/screens/landing_page/feature_container.dart';
import 'package:ainews/screens/landing_page/start_using_ai.dart';
// import 'package:ainews/screens/landing_page/widgets/features_slider.dart';
import 'package:flutter/material.dart';
import 'package:ainews/import.dart';
import 'package:ainews/home_scene.dart';

class LandingPage extends StatelessWidget{
  ScrollController _controller = ScrollController();
  // Define GlobalKey for the sections you want to scroll to
final GlobalKey productKey = GlobalKey();
final GlobalKey howItWorksKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor:Color(0xFF020012),
      endDrawer: Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
      body: 
      Scrollbar(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth >= 768 ? 70 : 20, // Adjust padding based on screen width
              ),
              child: 
              CustomScrollView(
                controller: _controller,
                scrollDirection: Axis.vertical,
                
                slivers: <Widget>[
        
                  
                  // SliverPersistentHeader containing your fixed header
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverHeaderDelegate(
                      minHeight: 120, // Set your desired header height
                      maxHeight: 120,
                      child: 

                      
                      Header(controller: _controller, HowItWorks: howItWorksKey,),
                      scrollController: _controller
                    ),
                  ),
        
                  
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        HomeScene(),
                        Jumbotron(),
                        Products(),
                        HowItWorks(),
                        Features(),
                        MovingContainers(),
                        SizedBox(height: 10,),
                        AnimatedContainers(),
                        // Text("Creators"),
                        Creators(),
                        Footer(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Delegate class for SliverPersistentHeader
class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  final ScrollController scrollController;

  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    required this.scrollController,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double opacity = (maxExtent - shrinkOffset) / maxExtent;

    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: maxHeight, // Adjust height as needed
              child: Stack(
                children: makeStar(
                  MediaQuery.of(context).size.width,
                  maxHeight,
                  opacity,
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  List<Widget> makeStar(double width, double height, double opacity) {
    List<Widget> stars = [];

    // Add stars to the background
    for (int i = 0; i < 50; i++) {
      double top = Random().nextDouble() * height;
      double left = Random().nextDouble() * width;
      double size = Random().nextDouble() * 3;

      stars.add(
        Positioned(
          top: top,
          left: left,
          child: Opacity(
            opacity: opacity,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      );
    }

    return stars;
  }
}
