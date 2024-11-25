import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final String imagePath;
  final String price;
  final String description;
  final String details;

  const RecommendedCard({
    super.key,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.5,
      margin: EdgeInsets.only(right: screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: screenWidth * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: const Icon(Icons.favorite, color: Colors.grey,size:24),
                ),
                
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(description, style: const TextStyle(fontSize: 16)),
          Text(details, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}

