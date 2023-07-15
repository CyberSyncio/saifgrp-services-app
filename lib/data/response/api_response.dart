// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:saif_app/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  Status? status;
  ApiResponse(
    this.message,
    this.data,
    this.status,
  );
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETE;
  ApiResponse.error() : status = Status.ERROR;
  @override
  String toString() {
    return "Message: $message\n, Status: $status\n, Data: $data\n";
  }
}
