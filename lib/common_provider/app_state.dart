import 'package:bitroot_org/common_models/user_data.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  User loginUserData = User(
    name: '',
    email: '',
    profilePic: '',
  );

  void updateLoginData({required User userData}) {
    loginUserData = userData;
    notifyListeners();
  }
}
