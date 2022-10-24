import 'package:flutter/material.dart';
import 'package:project_pas/components/search_bar.dart';
import 'package:project_pas/utils/constant.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate a list of 100 cards containing a text widget with it's index
    // and render it using a ResponsiveGridList

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Styles.primaryColor,
        toolbarHeight: 150,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo-white.png',
                  fit: BoxFit.contain,
                  height: 60,
                ),
                Text(
                  "Glow\nApp",
                  style: TextStyle(
                    height: 1,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            // add search bar
            SearchBar(),
          ]
        )
      ),
      body: ResponsiveGridList(
        horizontalGridMargin: 20,
        verticalGridMargin: 20,
        minItemWidth: 150,
        children: List.generate(
            10,
            (index) => InkWell(
                  onTap: () {
                    print('Card $index tapped');
                  },
                  child: Container(
                      width: 200,
                      height: 220,
                      // decoration: BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.grey.withOpacity(0.5),
                      //       spreadRadius: 2,
                      //       blurRadius: 10,
                      //       offset: const Offset(
                      //           0, 3), // changes position of shadow
                      //     ),
                      //   ],
                      //   borderRadius: BorderRadius.circular(20),
                      //   color: Colors.white,
                      // ),
                      child: Column(
                        children: [
                          // create photo and description
                          Container(
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          // create a price and icon cart
                          Container(
                            width: 200,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.brown[50],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                            color: Colors.black,),
                                      ),
                                      Text(
                                        '50 \$',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  padding: EdgeInsets.only(
                                    right: 10,
                                    left: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_cart_rounded,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                )),
      ),
    );
  }
}
