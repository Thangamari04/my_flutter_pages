import 'package:flutter/material.dart';
import '../widgets/location_card.dart';
import '../widgets/recommended_card.dart';
import '../widgets/host_section.dart';
import '../widgets/most_viewed_section.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Travel App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Explore the world! By Travelling",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.03),
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
                        SizedBox(width: constraints.maxWidth * 0.02),
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    const Text(
                      "Popular locations",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    SizedBox(
                      height: constraints.maxHeight * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          LocationCard(
                            location: "India",
                            imagePath:
                                "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/96/41/39/il-tempio-principale.jpg?w=1400&h=-1&s=1",
                          ),
                          LocationCard(
                            location: "Moscow",
                            imagePath:
                                "https://cdn.britannica.com/26/116526-050-76C37BBC/Cathedral-of-St-Basil-the-Blessed-Moscow.jpg?w=300",
                          ),
                          LocationCard(
                            location: "USA",
                            imagePath:
                                "https://static5.depositphotos.com/1030296/395/i/450/depositphotos_3958211-stock-photo-new-york-cityscape-tourism-concept.jpg",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    const Text(
                      "Recommended",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.04),
                    SizedBox(
                      height: constraints.maxHeight * 0.4,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          RecommendedCard(
                            imagePath:
                                "https://a0.muscache.com/im/pictures/prohost-api/Hosting-39578922/original/7634d5bf-91e8-474c-a90f-09af799055fa.jpeg?im_w=720",
                            price: "\$120",
                            description: "Cozy Apartment",
                            details: "Private room / 4 beds",
                          ),
                          RecommendedCard(
                            imagePath:
                                "https://www.shutterstock.com/image-illustration/modern-house-exterior-evening-view-260nw-2446517227.jpg",
                            price: "\$150",
                            description: "Modern Villa",
                            details: "Entire house / 6 beds",
                          ),
                        ],
                      ),
                    ),
                    const HostSection(),
                    const MostViewedSection(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
