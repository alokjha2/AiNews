
import 'package:flutter/material.dart';
import 'package:ainews/import.dart';

class LandingPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF020012),
      endDrawer: Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
      body: 
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth >= 768 ? 100 : 30, // Adjust padding based on screen width
            ),
            child: 
            CustomScrollView(
              slivers: <Widget>[
                // SliverPersistentHeader containing your fixed header
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverHeaderDelegate(
                    minHeight: 120, // Set your desired header height
                    maxHeight: 120,
                    child: 
                    
                    Header(),
                  ),
                ),

                
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Jumbotron(),
                      Products(),
                      HowItWorks(),
                      Features(),
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
    );
  }
}

// Delegate class for SliverPersistentHeader
class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
