import 'package:flutter/material.dart';
class ScrollableImagesWithPoints extends StatefulWidget {
  ScrollableImagesWithPoints({Key? key}) : super(key: key);

  @override
  _ScrollableImagesWithPointsState createState() =>
      _ScrollableImagesWithPointsState();
}

class _ScrollableImagesWithPointsState extends State<ScrollableImagesWithPoints> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "assets/item.jpg",
      "assets/item.jpg",
      "assets/item.jpg",
    ];

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),

          height: 200,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Padding(
                  padding: const EdgeInsets.all( 5.0),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
                (index) => buildDot(index),
          ),
        ),
      ],
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.black : Colors.white,
      ),
    );
  }
}
