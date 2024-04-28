import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../app_lists.dart';

class TopicTopBar extends StatefulWidget {
  const TopicTopBar({super.key});

  @override
  State<TopicTopBar> createState() => _TopicTopBarState();
}

class _TopicTopBarState extends State<TopicTopBar> {
  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                  for (int topicIndex = 0; topicIndex <= topics.length -1; topicIndex++) {
                    topics[topicIndex][1] = false;
                  }
                  topics[index][1] = !topics[index][1];
              });
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
                        color:
                        Theme.of(context).colorScheme.primary)),
                child: FittedBox(
                  child: Center(
                    child: Text(
                      '${topics[index][0]}',
                      style: TextStyle(
                          fontWeight: topics[index][1]
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: topics[index][1]
                              ? Theme.of(context)
                              .colorScheme
                              .secondary
                              : Theme.of(context)
                              .colorScheme
                              .primary),
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
        .fade()
        .slide(duration: 450.ms, begin: const Offset(1, 0));
  }
}
