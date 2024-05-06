import 'package:flutter/material.dart';

import '../app_lists.dart';

class ShoeSizeProvider extends ChangeNotifier {
  resetShoeSize({required int index}) {
    for (int shoesSizeIndex = 0;
        shoesSizeIndex <= shoesSize.length - 1;
        shoesSizeIndex++) {
      shoesSize[shoesSizeIndex][1] = false;
    }
    shoesSize[index][1] = !shoesSize[index][1];
    notifyListeners();
  }
}
