import 'package:flutter/material.dart';

class MostViewedSection extends StatelessWidget {
  const MostViewedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05),
            const Text(
              "Most Viewed",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Column(
              children: [
                _buildMostViewedItem(
                  imagePath:
                      "https://media.istockphoto.com/id/856794670/photo/beautiful-luxury-home-exterior-with-green-grass-and-landscaped-yard.jpg?s=612x612&w=0&k=20&c=Jaun3vYekdy6aBcqq5uDQp_neNp5jmdLZXZAqqhcjk8=",
                  price: "\$120",
                  stars: 4.5,
                  description: "Cozy Apartment",
                  details: "Private room / 4 beds",
                  context: context,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildMostViewedItem(
                  imagePath:
                      "https://t3.ftcdn.net/jpg/06/12/94/66/360_F_612946628_09a2AaQjN4BYyK81hZqENHlCdEyOLoX5.jpg",
                  price: "\$150",
                  stars: 4.8,
                  description: "Modern Villa",
                  details: "Entire house / 6 beds",
                  context: context,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildMostViewedItem(
                  imagePath:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRzx8ZdbMdsR_FmOTHx8wC01oC5l7qGNVSww&s",
                  price: "\$200",
                  stars: 5.0,
                  description: "Luxury Suite",
                  details: "Private suite / 2 beds",
                  context: context,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMostViewedItem({
    required String imagePath,
    required String price,
    required double stars,
    required String description,
    required String details,
    required BuildContext context,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.03),
                  topRight: Radius.circular(screenWidth * 0.03),
                ),
                child: Image.network(
                  imagePath,
                  width: double.infinity,
                  height: screenHeight * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  radius: screenWidth * 0.05,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      // Handle favorite action
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(height: screenHeight * 0.01),
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
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