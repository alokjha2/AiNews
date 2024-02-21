import 'package:flutter/material.dart';
import 'package:ainews/import.dart';

class Products extends StatefulWidget {
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // key: widget.productKey,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple.withOpacity(0.2), Colors.transparent, Colors.purple.withOpacity(0.2)],
        ),
        border: Border(
          top: BorderSide(width: 2.0, color: Colors.purple), // Top border
          bottom: BorderSide(width: 2.0, color: Colors.purple), // Bottom border
        ),
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7), // Light black color like console
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white, // Placeholder color, replace with your text prompt container
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // You can replace this with your actual text prompt content
                child: Center(child: Text("Your text prompt here")),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue, // Placeholder color, replace with your AI chat animation container
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // You can replace this with your actual AI chat animation content
                child: Center(child: Text("AI chat animation")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
