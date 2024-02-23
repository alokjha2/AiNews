import 'package:entry/entry.dart';
import 'package:flutter/material.dart';

class Creators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
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
              creator(image: 'assets/photo2.jpg', name: 'Dhruv'),
              creator(image: 'assets/photo3.jpg', name: 'Yash'),
              creator(image: 'assets/photo4.jpg', name: 'Dhanush'),
            ],
          ),
        ),
      ),
    );
  }

  Widget creator({required String image, required String name}) {
    return Column(
      children: [

        Entry(
                        xOffset: -1000,
                        scale: 20,
                        delay: const Duration(milliseconds: 500),
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.elasticInOut,
                        child: Entry(
                          opacity: .5,
                          angle: 3.1415,
                          scale: .5,
                          delay: const Duration(milliseconds: 900),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate,
                          child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(image),
        ),
                        ),
                      ),
        
        Text(name, style: TextStyle(color: Colors.white),),
      ],
    );
  }
}
