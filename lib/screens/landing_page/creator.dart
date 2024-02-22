import 'package:flutter/material.dart';

class Creators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border.all(
          color: Colors.grey, // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10.0), // Border radius
      ),

      // color: Colors.white, // Background color of the container
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            creator(image: 'assets/myphoto.jpg', name: 'Peckish Human'),
            creator(image: 'https://via.placeholder.com/150', name: 'Name 2'),
            creator(image: 'https://via.placeholder.com/150', name: 'Name 3'),
            creator(image: 'https://via.placeholder.com/150', name: 'Name 3'),
          ],
        ),
      ),
    );
  }

  Widget creator({required String image, required String name}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(image),
        ),
        Text(name, style: TextStyle(color: Colors.white),),
      ],
    );
  }
}
