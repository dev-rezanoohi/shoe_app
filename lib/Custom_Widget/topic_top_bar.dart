import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/Provider/topic_top_bar_provider.dart';
import '../app_lists.dart';

class TopicTopBar extends StatelessWidget {
  const TopicTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return Consumer<TopicProvider>(
            builder: (context, value, child) => GestureDetector(
              onTap: () {
                value.resetTopicBar(index: index);
              },
              child: AspectRatio(
                aspectRatio: 2.2 / 1,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: topics[index][1]
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary)),
                  child: FittedBox(
                    child: Center(
                      child: Text(
                        '${topics[index][0]}',
                        style: TextStyle(
                            fontWeight: topics[index][1]
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: topics[index][1]
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ).animate().fade().slide(duration: 450.ms, begin: const Offset(1, 0));
  }
}
