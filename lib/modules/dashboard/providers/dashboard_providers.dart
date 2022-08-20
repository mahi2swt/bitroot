import 'package:bitroot_org/common_models/responce_model.dart';
import 'package:bitroot_org/modules/dashboard/models/user_model.dart';
import 'package:bitroot_org/modules/dashboard/models/user_transection_model.dart';
import 'package:bitroot_org/modules/dashboard/repository/dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardProvider extends ChangeNotifier {
  //? Transection Repository

  final DashboardRepository _dashboardRepository = DashboardRepository();

  //? Transection Data List
  List<UserTransectionModel> transectionData = [];

  //? Fetch content from the json file
  //* -------------------------
  Future<void> getTransectionData() async {
    final ResponseModel response =
        await _dashboardRepository.getTransectionData();
    if (response.data != null) {
      transectionData = response.data as List<UserTransectionModel>;
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: response.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
  //! -------------------------

  // ---------------------------------------

  //? Transection Data List
  List<UserModel> recentUsers = [];

  //? Fetch content from the json file
  //* -------------------------
  Future<void> getRecentData() async {
    final ResponseModel response =
        await _dashboardRepository.getRecentUserData();
    if (response.data != null) {
      recentUsers = response.data as List<UserModel>;
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: response.message.toString(),
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
  //! -------------------------
}
