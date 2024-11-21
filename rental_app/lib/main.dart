import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'poppins_medium',
      ),
      home: TravelPage(),
    );
  }
}

class TravelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Explore the world! By Travelling",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Where did you go?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "Popular locations",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildLocationCard("India", "assets/india.jpg"),
                    _buildLocationCard("Moscow", "assets/moscow.jpg"),
                    _buildLocationCard("USA", "assets/usa.jpg"),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRecommendedCard(
                      imagePath: "assets/image1.jpg",
                      price: "\$120",
                      description: "Cozy Apartment",
                      details: "Private room / 4 beds",
                    ),
                    _buildRecommendedCard(
                      imagePath: "assets/image2.jpg",
                      price: "\$150",
                      description: "Modern Villa",
                      details: "Entire house / 6 beds",
                    ),
                    _buildRecommendedCard(
                      imagePath: "assets/image3.jpg",
                      price: "\$200",
                      description: "Luxury Suite",
                      details: "Private suite / 2 beds",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              HostSection(), 
              MostViewedSection(),// Added HostSection to the scrolling layout
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard(String location, String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.black54,
          child: Text(
            location,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedCard({
    required String imagePath,
    required String price,
    required String description,
    required String details,
  }) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.orange,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            details,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}


class HostSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: const DecorationImage(
          image: AssetImage('assets/1.jpg'), // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Add a semi-transparent overlay for better contrast
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hosting fee for",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text color
                  ),
                ),
                const Text(
                  "as low as 1%",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // White text color
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // Action for Become a Host button
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Red button background
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Become a Host",
                    style: TextStyle(color: Colors.white), // White text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class MostViewedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:24.0,left:6.0,right:6.0,bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Most Viewed",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              _buildMostViewedItem(
                imagePath: "assets/image4.jpg",
                price: "\$120",
                stars: 4.5,
                description: "Cozy Apartment",
                details: "Private room / 4 beds",
              ),
              const SizedBox(height: 16),
              _buildMostViewedItem(
                imagePath: "assets/image5.jpg",
                price: "\$150",
                stars: 4.8,
                description: "Modern Villa",
                details: "Entire house / 6 beds",
              ),
              const SizedBox(height: 16),
              _buildMostViewedItem(
                imagePath: "assets/image6.jpg",
                price: "\$200",
                stars: 5.0,
                description: "Luxury Suite",
                details: "Private suite / 2 beds",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMostViewedItem({
    required String imagePath,
    required String price,
    required double stars,
    required String description,
    required String details,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price and Star Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        Text(
                          stars.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Description
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                // Details
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}