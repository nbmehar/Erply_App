import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:erply_login/models/user_info.dart';
import 'package:erply_login/services/login_services.dart';
import 'app_exceptions.dart';

class BaseClient {
  static const int timeOutDuration = 20;

  //GET
  Future<dynamic> get(String baseUrl, String api, {var headers}) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      UserInfo userInfo = await LoginServices().getLoginInfo();
      var response = await http
          .get(uri,
              headers: headers ??
                  {
                    'sessionKey': userInfo.sessionKey!,
                    'clientCode': userInfo.clientCode!
                  })
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //POST
  Future<dynamic> post(String baseUrl, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl);
    List<String> inputLogs = [];
    inputLogs.add("\n");
    inputLogs.add("Request URL : $baseUrl");
    inputLogs.add("Parameters : $payloadObj");
    inputLogs.add("\n");
    debugPrint(inputLogs.join("\n").toString());
    try {
      var response = await http
          .post(uri, body: payloadObj)
          .timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return _checkApiResponse(responseJson);
      case 201:
        var responseJson = jsonDecode(response.body);
        return _checkApiResponse(responseJson);
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }

  dynamic _checkApiResponse(dynamic jsonResponse) {
    try {
      int status = jsonResponse["status"]["errorCode"];

      if (jsonResponse["status"]["responseStatus"] != "error") {
        return jsonResponse;
      } else {
        switch (status) {
          case 1054:
            throw SessionOverException(
              'Session over',
            );
          case 1051:
            throw InvalidCredentials('incorrect username or password');
          case 1052:
            throw InvalidCredentials(
                'User has been temporarily blocked because of repeated unsuccessful login attempts.');
          default:
            throw BadRequestException(
              'bad request',
            );
        }
      }
    } catch (e) {
      return jsonResponse;
    }
  }
}
