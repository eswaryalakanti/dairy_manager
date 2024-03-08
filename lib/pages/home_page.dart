import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Declare and initialize selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 200,
        flexibleSpace: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                    items: [
                      'images/i3.jpg',
                      'images/i2.jpg',
                    ].map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(
                                i == _selectedIndex ? 0.9 : 0.4,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 20), // Adding spacing between the carousel and text
              Text(
                "Tools",
                style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), // Adding spacing between the text and grid

              // 3x2 grid with icons and text
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // Icon A
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add onPressed action for Icon A
                        },
                        icon: Image.asset(
                          'images/orders.jpg', // Provide the path to your image
                          width: 24, // Adjust width as needed
                          height: 24, // Adjust height as needed
                        ),
                      ),
                      Text('Orders'), // Text for Icon A
                    ],
                  ),
                  // Icon B
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add onPressed action for Icon B
                        },
                        icon: Image.asset(
                          'images/vet.jpg', // Provide the path to your image
                          width: 24, // Adjust width as needed
                          height: 24, // Adjust height as needed
                        ),
                      ),
                      Text('Vet'), // Text for Icon B
                    ],
                  ),
                  // Icon C
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add onPressed action for Icon C
                        },
                        icon: Image.asset(
                          'images/products.jpg', // Provide the path to your image
                          width: 24, // Adjust width as needed
                          height: 24, // Adjust height as needed
                        ),
                      ),
                      Text('Products'), // Text for Icon C
                    ],
                  ),
                  // Icon D
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add onPressed action for Icon D
                        },
                        icon: Image.asset(
                          'images/cattle.jpg', // Provide the path to your image
                          width: 24, // Adjust width as needed
                          height: 24, // Adjust height as needed
                        ),
                      ),
                      Text('Cattle'), // Text for Icon D
                    ],
                  ),
                  // Icon E
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add onPressed action for Icon E
                        },
                        icon: Image.asset(
                          'images/trade.jpg', // Provide the path to your image
                          width: 24, // Adjust width as needed
                          height: 24, // Adjust height as needed
                        ),
                      ),
                      Text('Trade'), // Text for Icon E
                    ],
                  ),
                  // Icon F
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add onPressed action for Icon F
                        },
                        icon: Image.asset(
                          'images/tasks.jpg', // Provide the path to your image
                          width: 24, // Adjust width as needed
                          height: 24, // Adjust height as needed
                        ),
                      ),
                      Text('Tasks'), // Text for Icon F
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
