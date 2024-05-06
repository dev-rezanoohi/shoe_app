import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/Custom_Widget/shoe_tile.dart';
import 'package:shoe_app/Provider/shoe_size_provider.dart';

import '../app_lists.dart';

class Shoes extends StatelessWidget {
  const Shoes({super.key, required this.image, required this.tag});
  final String image;
  final String tag;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    log('build');
    return Scaffold(
      body: Hero(
        tag: tag,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.0)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sneakers',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.05,
                            fontWeight: FontWeight.bold),
                      )
                          .animate()
                          .then(delay: 500.ms)
                          .fade()
                          .slideY(duration: 350.ms),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        'Size',
                        style: TextStyle(
                            color: Colors.white, fontSize: size.height * 0.03),
                      )
                          .animate()
                          .then(delay: 500.ms)
                          .fade()
                          .slideY(duration: 400.ms),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ListView.builder(
                          itemCount: shoesSize.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Consumer<ShoeSizeProvider>(
                              builder: (context, value, child) =>
                                  GestureDetector(
                                    onTap: () {
                                      value.resetShoeSize(index: index);
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 250),
                                      width: size.height * 0.07,
                                      height: size.height * 0.07,
                                      margin: const EdgeInsets.only(right: 20.0),
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          color: shoesSize[index][1]
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: FittedBox(
                                        child: Center(
                                          child: Text(
                                            '${shoesSize[index][0]}',
                                            style: TextStyle(
                                                color: shoesSize[index][1]
                                                    ? Colors.black
                                                    : Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            );
                          },
                        ),
                      )
                          .animate()
                          .then(delay: 500.ms)
                          .fade()
                          .slideY(duration: 450.ms),
                      SizedBox(
                        height: size.height * 0.09,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Buy now',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                          .animate()
                          .then(delay: 500.ms)
                          .fade()
                          .slideY(duration: 500.ms),
                      SizedBox(
                        height: size.height * 0.09,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
