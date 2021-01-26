import 'package:flutter/material.dart';

class ThemeBloc extends ChangeNotifier {
  ThemeData _tema;

  ThemeBloc([this._tema]);

  ThemeData get tema => _tema;
  set tema(ThemeData tema_) {
    _tema = tema_;
    notifyListeners();
  }

  void dispose() {
    print("Se libero el provider");
  }
}
