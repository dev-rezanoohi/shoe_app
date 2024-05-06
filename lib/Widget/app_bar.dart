import 'dart:ui';
import 'package:flutter/material.dart';

AppBar myAppBar({required context}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
    title: Text(
      'Shoes',
      style:
          TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 25),
    ),
    actions: [
      // Favorites page
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_sharp,
          ),),
      // Notifications
      IconButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              duration: const Duration(seconds: 1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              content: Text(
                'Nothing to show!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.notifications_none,
        ),
      )
    ],
    // For blur the app bar
    flexibleSpace: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 40),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );
}
