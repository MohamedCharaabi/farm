import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:farm_mobile/domain/base_api_service.dart';
import 'package:farm_mobile/domain/models/api_result.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  static NetworkApiService? _instance;
  NetworkApiService._internal();

  static NetworkApiService getInstance() {
    _instance ??= NetworkApiService._internal();

    return _instance!;
  }

  @override
  Future<ApiResult?> getResponse<T>(String url, {String? successMsg}) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
      if (successMsg != null) {
        Fluttertoast.showToast(
          msg: successMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future<ApiResult?> postResponse(String url,
      {required Map<String, dynamic> body,
      Map<String, String>? headers,
      String? successMsg}) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      log('response: ${response.body}');
      responseJson = returnResponse(response);
      // if (responseJson['status'] == 'error') {
      //   throw FetchDataException(responseJson['message']);
      // }
      if (successMsg != null) {
        Fluttertoast.showToast(
          msg: successMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
    } on SocketException {
      responseJson = null;
      Fluttertoast.showToast(
        msg: 'No Internet connection',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
      // throw FetchDataException('No Internet connection');
    } catch (e) {
      responseJson = null;

      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
      // throw FetchDataException(e.toString());
    }

    return responseJson;
  }

  @override
  Future<ApiResult> deleteResponse(String url, Map<String, String>? headers) {
    // TODO: implement deleteResponse
    throw UnimplementedError();
  }

  @override
  Future<ApiResult?> putResponse(
      String url, Map<String, dynamic> body, Map<String, String>? headers,
      {String? successMsg}) async {
    ApiResult? responseJson;
    try {
      final response = await http.put(Uri.parse(url),
          body: jsonEncode(body), headers: headers);
      // log('response: ${response.body}');
      responseJson = returnResponse(response);
      // if (responseJson['status'] == 'error') {
      //   throw FetchDataException(responseJson['message']);
      // }
      if (successMsg != null) {
        Fluttertoast.showToast(
          msg: successMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
      return responseJson;
    } on SocketException {
      responseJson = null;
      Fluttertoast.showToast(
        msg: 'No Internet connection',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        // backgroundColor: waterColor,
        // textColor: jacartaColor,
        fontSize: 16.0,
      );
    } catch (e) {
      responseJson = null;

      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0,
      );
      // throw FetchDataException(e.toString());
    }
  }

  ApiResult returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return ApiResult.success(data: responseJson);
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return ApiResult.success(data: responseJson);

      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
