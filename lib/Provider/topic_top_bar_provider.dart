import 'package:flutter/material.dart';

import '../app_lists.dart';

class TopicProvider extends ChangeNotifier {
  resetTopicBar({required int index}) {
    for (int topicIndex = 0; topicIndex <= topics.length - 1; topicIndex++) {
      topics[topicIndex][1] = false;
    }
    topics[index][1] = !topics[index][1];
    notifyListeners();
  }
}