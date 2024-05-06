import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../View/shoes.dart';

class ShoeTile extends StatelessWidget {
  const ShoeTile(
      {super.key, required this.image, required this.tag, required this.price});

  final String image;
  final String tag;
  final String price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Get.to(Shoes(
            image: image,
            tag: tag,
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(bottom: 20.0),
          height: size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                offset: const Offset(0, 10),
                blurRadius: 10.0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
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
                            .then(delay: 400.ms)
                            .fade()
                            .slideY(duration: 350.ms),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Nike',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.03,
                          ),
                        )
                            .animate()
                            .then(delay: 400.ms)
                            .fade()
                            .slideY(duration: 350.ms)
                      ],
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .then(delay: 400.ms)
                      .fade()
                      .slideY(duration: 350.ms)
                ],
              ),
              Text(
                '$price\$',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height * 0.05,
                    fontWeight: FontWeight.bold),
              ).animate().then(delay: 400.ms).fade().slideY(duration: 350.ms)
            ],
          ),
        ),
      ),
    ).animate().fade().slideY(duration: 400.ms).shimmer();
  }
}
