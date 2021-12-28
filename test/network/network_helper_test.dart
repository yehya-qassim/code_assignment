import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:new_york_times_articles/network/network_helper.dart';
import 'package:new_york_times_articles/network/network_enums.dart';

import '../fixture/fixture_reader.dart';

void main() {
  group('filterResponse', () {
    test(
      'should error type responseEmpty for response null',
          () async {
        //act
        final result = NetworkHelper.filterResponse(
          response: null,
          callback: (json) => true,
          onFailureCallback: (
              NetworkResponseErrorType errorType,
              String? message,
              ) {
           return errorType;
          },
        );
        //assert
        expect(result, NetworkResponseErrorType.responseEmpty);
      },
    );

    test(
      'should error type responseEmpty for response body null',
          () async {
        //act
        final result = NetworkHelper.filterResponse(
          response: http.Response('', 404),
          callback: (json) => true,
          onFailureCallback: (
              NetworkResponseErrorType errorType,
              String? message,
              ) =>
              errorType,
        );
        //assert
        expect(result, NetworkResponseErrorType.responseEmpty);
      },
    );

    test(
      'should error type socket server',
          () async {
        //act
        final result = NetworkHelper.filterResponse(
          response: http.Response('{}', 1708),
          callback: (json) => true,
          onFailureCallback: (
              NetworkResponseErrorType errorType,
              String? message,
              ) =>
              errorType,
        );
        //assert
        expect(result, NetworkResponseErrorType.socket);
      },
    );

    test(
      'should return true for normal response',
          () async {
        //arrange
        final String fix = fixture('success_response');
        //act
        final result = NetworkHelper.filterResponse(
            response: http.Response(fix, 200),
            callback: (json) => true,
            onFailureCallback: (
                NetworkResponseErrorType errorType,
                String? message,
                ) =>
            errorType,
            callBackParameterName: CallBackParameterName.all);
        //assert
        expect(result, true);
      },
    );
  });


  group('isRequestSucceeded', () {
    test(
      'should return false for empty response',
          () async {
        //act
        final result = NetworkHelper.isRequestSucceeded({});
        //assert
        expect(result, false);
      },
    );
    test(
      'should return true for normal responses',
          () async {
        // assert
        final fix = fixture('success_response');
        //act
        final result = NetworkHelper.isRequestSucceeded(jsonDecode(fix));
        //assert
        expect(result, true);
      },
    );
  });

  group('concatUrlQP', () {
    test(
      'should return empty when url is empty',
          () async {
        //act
        final url = NetworkHelper.concatUrlQP('', {'par1': '1'});
        //assert
        expect(url, '');
      },
    );
    test(
      'should return url as url when queryParameters is null',
          () async {
        //act
        final url = NetworkHelper.concatUrlQP('http://google.com', null);
        //assert
        expect(url, url);
      },
    );
    test(
      'should return url as url when queryParameters is with length 0',
          () async {
        //act
        final url = NetworkHelper.concatUrlQP('http://google.com', {});
        //assert
        expect(url, url);
      },
    );
    test(
      'should return http://google.com?par1=1',
          () async {
        //act
        final url = NetworkHelper.concatUrlQP('http://google.com', {'par1': '1'});
        //assert
        expect(url, 'http://google.com?par1=1');
      },
    );
    test(
      'should return http://google.com?par1=1&par2=abc',
          () async {
        //act
        final url = NetworkHelper.concatUrlQP('http://google.com', {
          'par1': '1',
          'par2': 'abc',
        });
        //assert
        expect(url, 'http://google.com?par1=1&par2=abc');
      },
    );
    test(
      'should remove values with empty value',
          () async {
        //act
        final url = NetworkHelper.concatUrlQP('http://google.com', {
          'par1': '',
          'par2': 'abc',
          'par3': '',
        });
        //assert
        expect(url, 'http://google.com?par2=abc');
      },
    );
    test(
      'should throw exception when one of the parameters contains space',
          () async {
        //act
         call () => NetworkHelper.concatUrlQP('http://google.com', {
          'par': 'ab c',
        });
        //assert
        expect(call, throwsA(isInstanceOf<Exception>()));
      },
    );
  });
}
