import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shoe_app/widgets/app_drawer.dart';
import 'package:shoe_app/widgets/shoe_tile.dart';
import 'package:shoe_app/widgets/topic_top_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 40),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        title: Text(
          'Shoes',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    duration: const Duration(milliseconds: 600),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18))),
                    content: Text(
                      'Nothing to show!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),
                    )));
              },
              icon: const Icon(
                Icons.notifications_none,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const TopicTopBar(),
                SizedBox(
                  height: size.height * 0.03,
                ),
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
      ),
    );
  }
}
