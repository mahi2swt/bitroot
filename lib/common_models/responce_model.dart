class ResponseModel {
  bool success = false;
  String? message = "";
  dynamic data;
  ResponseModel.failed({
    this.message,
  }) : success = false;

  ResponseModel.success() : success = true;

  ResponseModel.successWithData({
    this.data,
  }) : success = true;
}
