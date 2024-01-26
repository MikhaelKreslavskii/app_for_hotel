import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotelImageScrollCard extends StatefulWidget {
  final List<String> images;
  const HotelImageScrollCard({required this.images});

  @override
  State<HotelImageScrollCard> createState() =>
      _HotelImageScrollCardState(images);
}

class _HotelImageScrollCardState extends State<HotelImageScrollCard> {
  final List<String> images;
  final _controller = PageController();
  _HotelImageScrollCardState(this.images);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 333,
      height: 257,
      child: Stack(children: [
        Container(
            child: PageView.builder(
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      imageUrl: images[index],
                      imageBuilder: (context, imageProvider) {
                        log("Here");
                        return Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ));
                      });
                })),
        Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: images.length,
                      effect: SwapEffect(
                        activeDotColor: Colors.black,
                        radius: 10,
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Color.fromARGB(255, 206, 205, 205),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
