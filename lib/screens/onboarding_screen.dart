import 'package:flutter/material.dart';
import 'package:project_pas/screens/home.dart';
import 'package:project_pas/screens/intro_screens/intro_page_1.dart';
import 'package:project_pas/screens/intro_screens/intro_page_2.dart';
import 'package:project_pas/screens/intro_screens/intro_page_3.dart';
import 'package:project_pas/screens/intro_screens/intro_page_4.dart';
import 'package:project_pas/utils/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  PageController _controller = PageController();

  // keep track of if we're on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 3);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
            IntroPage4(),
          ],
        ),

        // dot indicators
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(3);
                    },
                    child: Text("Skip")),

                // dot indicators
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Styles.grey,
                    activeDotColor: Styles.black,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),
                ),

                // next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }),
                          );
                        },
                        child: Text("done"))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text("next")),
              ],
            )),
      ],
    ));
  }
}
