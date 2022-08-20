import 'dart:async';

import 'package:bitroot_org/common_models/user_data.dart';
import 'package:bitroot_org/common_provider/app_state.dart';
import 'package:bitroot_org/constants/images.dart';
import 'package:bitroot_org/modules/common_component/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/hive_setup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AppState _appState;
  @override
  void initState() {
    _appState = Provider.of<AppState>(context, listen: false);
    storeDataToLocal();
    HiveBox.getStuffFromBox(key: 'userData').then(
      (value) {
        _appState.updateLoginData(
          userData: value ??
              User(
                name: '',
                email: '',
                profilePic: '',
              ),
        );
      },
    );
    moveToNextScreen();
    super.initState();
  }

  Future<void> moveToNextScreen() async {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const MainScreen();
            },
          ),
        );
      },
    );
  }

  Future<void> storeDataToLocal() async {
    await HiveBox.putStuffInBox(
      key: 'userData',
      value: User(
        name: 'Mae Jamison',
        email: 'mae_jamison@gmail.com',
        profilePic: "https://randomuser.me/api/portraits/women/24.jpg",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F76F9),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(Images.logo),
      ),
    );
  }
}
