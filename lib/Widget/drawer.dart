import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Image(
              image: const AssetImage('assets/images/nike_logo.webp'),
              color: Theme.of(context).colorScheme.primary,
              height: size.height * 0.1,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text('Nike sneakers shop',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
