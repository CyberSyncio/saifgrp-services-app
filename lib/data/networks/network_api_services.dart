// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiService extends BaseApiServices {
//*..................................GET API....................................

  @override
  Future<dynamic> getApi({
    required String url,
    Map<String, String>? header,
  }) async {
    if (kDebugMode) {
      print("The GetApi url is for testing :$url");
    }
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: header,
          )
          .timeout(const Duration(seconds: 15));
      responseJson = returnResponseJson(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimout {
      throw RequestTimout();
    }
    //print(responseJson);
    return responseJson;
  }

//*..................................POST API...................................
  @override
  Future postApi(
      {required dynamic data,
      Map<String, String>? header,
      required String url}) async {
    if (kDebugMode) {
      print("The PostApi url is for testing :$url and Data is $data");
    }
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), headers: header, body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponseJson(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimout {
      throw RequestTimout();
    }
    //print(responseJson);
    return responseJson;
  }

//* ------------------------------PUT API----------------------------------------
  @override
  Future putApi(
      {required dynamic data,
      Map<String, String>? header,
      required String url}) async {
    if (kDebugMode) {
      print("The PutApi url is for testing :$url and Data is $data");
    }
    dynamic responseJson;
    try {
      final response = await http
          .put(Uri.parse(url), headers: header, body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponseJson(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimout {
      throw RequestTimout();
    }
    //print(responseJson);
    return responseJson;
  }

  returnResponseJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJsn = jsonDecode(response.body);
        return responseJsn;
      case 201:
        dynamic responseJsn = jsonDecode(response.body);
        return responseJsn;
      case 400:
        throw InvalidUrlException(response.body);
      case 401:
        throw InvalidTokenException(response.body);
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            "Error while communicating  : ${response.statusCode.toString()}");
    }
  }
}
