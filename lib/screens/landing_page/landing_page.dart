
import 'package:ainews/import.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: Container(
        constraints: BoxConstraints(maxWidth: 300),
        child: SideMenu()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(
          slivers: <Widget>[
            // SliverPersistentHeader containing your fixed header
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverHeaderDelegate(
                minHeight: 120, // Set your desired header height
                maxHeight: 120,
                child: Header(),
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
              ]),
            ),
          ],
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
