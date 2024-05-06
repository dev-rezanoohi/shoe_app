import 'package:flutter/material.dart';
import 'package:shoe_app/Widget/app_bar.dart';
import '../Widget/drawer.dart';
import '../Custom_Widget/shoe_tile.dart';
import '../Custom_Widget/topic_top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const MyDrawer(),
      // Blur app bar => shoe_app/Widget/app_bar.dart
      appBar: myAppBar(context: context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // topics in the top of the app => shoe_app/Custom_Widget/topic_top_bar.dart
              const TopicTopBar(),
              SizedBox(
                height: size.height * 0.03,
              ),
              // TODO: Shoes display using list view builder (API)
              const ShoeTile(
                image: 'assets/images/red_shoe.jpg',
                tag: 'redShoe',
                price: '100',
              ),
              const ShoeTile(
                image: 'assets/images/blue_shoe.jpg',
                tag: 'blueShoe',
                price: '89',
              ),
              const ShoeTile(
                image: 'assets/images/yellow_shoe.jpg',
                tag: 'yellowShoe',
                price: '67',
              )
            ],
          ),
        ),
      ),
    );
  }
}
