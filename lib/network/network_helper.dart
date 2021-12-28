import 'dart:convert';

import 'package:http/http.dart' as http;

import 'network_enums.dart';
import 'network_typedefs.dart';

class NetworkHelper {
  const NetworkHelper._();

  static String concatUrlQP(String url, Map<String, String>? queryParameters) {
    if (url.isEmpty) return url;
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParameters.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }

  static bool isRequestSucceeded(Map<String, dynamic> json) {
    return json['status'] == 'OK' &&
        json['results'] != null &&
        json['results'] is List;
  }

  static R filterResponse<R>({
    required http.Response? response,
    required NetworkCallBack<R> callback,
    required NetworkOnFailureCallBackWithMessage<R> onFailureCallback,
    CallBackParameterName callBackParameterName = CallBackParameterName.all,
  }) {
    try {
      if (response == null || response.body == '') {
        return onFailureCallback.call(
            NetworkResponseErrorType.responseEmpty, 'empty response or body');
      }

      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (isRequestSucceeded(json)) {
          return callback(callBackParameterName.getJson(json));
        }
      } else if (response.statusCode == 1708) {
        return onFailureCallback.call(
            NetworkResponseErrorType.socket, 'status code 1708');
      }
      return onFailureCallback.call(
          NetworkResponseErrorType.didNotSucceededFromServer, 'Unknown error');
    } catch (e) {
      return onFailureCallback.call(
          NetworkResponseErrorType.exception, e.toString());
    }
  }
}
