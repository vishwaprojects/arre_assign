import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRef = ChangeNotifierProvider(
  (ref) {
    return HomeController();
  },
);

class HomeController with ChangeNotifier {
  bool _isClicked = false;
  bool get isClicked => _isClicked;

  updateIsClicked(bool val) {
    _isClicked = val;
    notifyListeners();
  }

  bool _showBottomPlayer = false;
  bool get showBottomPlayer => _showBottomPlayer;

  updateBottomPlayer(bool val) {
    _showBottomPlayer = val;
    notifyListeners();
  }
}
