import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'network_helper.dart';

enum RequestType { get }

class NetworkService {
  const NetworkService._();

  static Map<String, String> _getHeaders() => <String, String>{
        "Content-Type": "application/json",
      };

  static Future<http.Response>? _createRequest({
    required Uri uri,
    required RequestType requestType,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    if (requestType == RequestType.get) {
      return http.get(uri, headers: headers);
    }
  }

  static Future<http.Response?>? sendRequest({
    required String uri,
    required RequestType requestType,
    Map<String, dynamic>? body,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final _headers = _getHeaders();
      final _uri = NetworkHelper.concatUrlQP(uri, queryParameters);

      final response = await _createRequest(
        uri: Uri.parse(_uri),
        headers: _headers,
        requestType: requestType,
        body: body,
      );

      return response;
    } on SocketException catch (e) {
      debugPrint('Network Service - on SocketException ${e.toString()}');
      return http.Response('{}', 1708);
    } catch (e) {
      debugPrint('Network Service ${e.toString()}');
      return null;
    }
  }
}
