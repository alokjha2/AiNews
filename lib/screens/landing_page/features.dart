
import 'package:ainews/import.dart';

class Features extends StatefulWidget {
  
  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  int _selectedPointIndex = 0; // Index of the selected point on the timeline

  // Define your timeline data
  List<String> _timelineData = [
    'Event 1',
    'Event 2',
    'Event 3',
    // Add more events as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 200,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: _timelineData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_timelineData[index]),
                  onTap: () {
                    setState(() {
                      _selectedPointIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: _buildTimelineDetail(),
          ),
        ],
      ),
    );
  }

 Widget _buildTimelineDetail() {
  
    return Container(
      child: Text('Event details: ${_timelineData[_selectedPointIndex]}'),
    );
  
  }
}


