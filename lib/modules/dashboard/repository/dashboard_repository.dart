import 'dart:convert';

import 'package:bitroot_org/common_models/responce_model.dart';
import 'package:bitroot_org/modules/dashboard/models/user_model.dart';
import 'package:bitroot_org/modules/dashboard/models/user_transection_model.dart';
import 'package:flutter/services.dart';

class DashboardRepository {
  //? getting Recent User Data From Json
  //*-----------------------------------
  Future<ResponseModel> getRecentUserData() async {
    final String response =
        await rootBundle.loadString('assets/json/user_list.json');
    final data = await json.decode(response);
    if (data != null) {
      final items = data["items"] as List?;
      final List<UserModel> transectionData = items!
          .map(
            (e) => UserModel.fromMap(e as Map<String, dynamic>),
          )
          .toList();

      return ResponseModel.successWithData(data: transectionData);
    } else {
      return ResponseModel.failed(message: 'Somthing went wrong!');
    }
  }

  //!-----------------------------------

  //-------------------------------------

  //? getting Transection Data From Json
  //*-----------------------------------
  Future<ResponseModel> getTransectionData() async {
    final String response =
        await rootBundle.loadString('assets/json/transection_data.json');
    final data = await json.decode(response);
    if (data != null) {
      final items = data["items"] as List?;
      final List<UserTransectionModel> transectionData = items!
          .map(
            (e) => UserTransectionModel.fromMap(e as Map<String, dynamic>),
          )
          .toList();

      return ResponseModel.successWithData(data: transectionData);
    } else {
      return ResponseModel.failed(message: 'Somthing went wrong!');
    }
  }
  //!-----------------------------------

}
