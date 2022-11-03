import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

final List<String> imgList = [
  'images/food1.jpg',
  'images/food2.jpg',
  'images/food3.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.fill, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(198, 230, 221, 221),
                            Color.fromARGB(131, 253, 248, 248)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class VerticalSlider extends StatefulWidget {
  const VerticalSlider({Key? key}) : super(key: key);

  @override
  State<VerticalSlider> createState() => _VerticalSliderState();
}

class _VerticalSliderState extends State<VerticalSlider> {
  int _currentIndex = 0;
  String disc = "Video Player of image 0";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index; //<-- Page index
                });
              },
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              autoPlay: false,
            ),
            items: imageSliders,
          ),
          onTap: () async {
            indexMethod(_currentIndex.toString());
          },
        ),
        SizedBox(
          height: 20,
        ),
        Center(child: Text(disc))
      ],
    );
  }

  indexMethod(String index) async {
    switch (index) {
      case '0':
        {
          disc = "Video Player of image $index";
        }
        break;
      case '1':
        {
          disc = "Video Player of image $index";
        }
        break;
      case '2':
        {
          disc = "Video Player of image $index";
        }
        break;
    }
  }
}
