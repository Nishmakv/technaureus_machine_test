import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:technaureus_machine_test/common/app_constants.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.23,
      width: screenWidth * 0.94,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CarouselSlider(
        items: bannerImages
            .take(5)
            .map((e) => Builder(
                  builder: (BuildContext context) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            e,
                            fit: BoxFit.cover,
                          ),
                        ));
                  },
                ))
            .toList(),
        options: CarouselOptions(
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}
