import 'package:flutter/material.dart';

class Features extends StatefulWidget {
  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> with TickerProviderStateMixin {
  int _selectedPointIndex = 0; // Index of the selected point on the timeline
  bool _isDetailVisible = false;

  // Define your timeline data
  late AnimationController _animationController;

  // Define your timeline data
  final Map<String, dynamic> _timelineData = {
    'Chat': "Chat with your AI buddy",
    'Video Call': "Have Video call",
    'Video News': "Get AI generated Video News",
    // Add more events as needed
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: size.width,
      height: size.height / 1.2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Constant vertical divider
          Container(
            decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.only(
        topLeft: Radius.circular(4), // Circular border at top-left
        topRight: Radius.circular(4), // Circular border at top-right
        bottomLeft: Radius.circular(4), // Circular border at bottom-left
        bottomRight: Radius.circular(4), // Circular border at bottom-right
      ),
            ),
  width: 2,
  height: size.height / 1.8, // Limiting the height of the divider
  
  child: Stack(
    children: [
      // White portion above the selected item
      Positioned(
        top: _selectedPointIndex * (size.height / 2.2 / _timelineData.length),
        left: 0,
        right: 0,
        height: size.height / _timelineData.length / 5.8, // Adjust height of the blue portion
        child: Material(
          elevation: 10,
          child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.blue, // Blue color for selected portion
                  borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), // Circular border at top-left
          topRight: Radius.circular(10), // Circular border at top-right
          bottomLeft: Radius.circular(10), // Circular border at bottom-left
          bottomRight: Radius.circular(10), // Circular border at bottom-right
                ),

                ),
                
              ),
        ),

      ),


    ],
  ),
),




          SizedBox(width: 6,),

          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: _timelineData.length,
              itemBuilder: (context, index) {
                List<String> allEntries = _timelineData.keys.toList();
                
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: _selectedPointIndex == index
                        ? LinearGradient(
                            colors: [
                              Color.fromARGB(131, 5, 134, 239),
                              Colors.transparent
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                        : null, // No gradient when not selected
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    // leading:  // Empty SizedBox if not selected
                    title: Text(
                     allEntries[index],
                      style: TextStyle(
                        color: _selectedPointIndex == index
                            ? Colors.white
                            : Colors.white30,
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selectedPointIndex = index;
                        _isDetailVisible = true; 
                        _animationController.forward(from: 0.0);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        Expanded(
            flex: 3,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 - (_animationController.value * 0.2),
                  child: Opacity(
                    opacity: _isDetailVisible ? 1.0 : 0.0,
                    child: _buildTimelineDetail(size),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineDetail(size) {
  // Get the selected key and entry
  String selectedKey = _timelineData.keys.toList()[_selectedPointIndex];
  MapEntry selectedEntry = _timelineData.entries.toList()[_selectedPointIndex];

  return Container(
    height: size.height / 1.1,
    width: size.width / 2,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: Colors.white30, width: 1),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Selected Key: $selectedKey'),
        Text('Selected Entry: $selectedEntry'),
      ],
    ),
  );
}
}
