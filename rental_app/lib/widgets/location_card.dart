import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String location;
  final String imagePath;

  const LocationCard({
    super.key,
    required this.location,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.3,
      margin: EdgeInsets.only(right: screenWidth * 0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            location,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

