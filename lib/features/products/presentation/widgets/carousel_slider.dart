import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/common/common.dart';
import 'package:technaureus_machine_test/core/core.dart';



class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: bannerImages
          .take(5)
          .map((e) => Builder(
                builder: (BuildContext context) {
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
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
        height: context.height * 0.27,
        disableCenter: true,
        viewportFraction: 0.90,
      ),
    );
  }
}
