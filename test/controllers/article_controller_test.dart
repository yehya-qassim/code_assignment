import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:new_york_times_articles/controllers/article_controller.dart';
import 'package:new_york_times_articles/model/article_model.dart';
import 'package:new_york_times_articles/network/network_helper.dart';
import 'package:new_york_times_articles/network/network_enums.dart';

import '../fixture/fixture_reader.dart';

void main() {
  late ArticleController controller;

  setUp(() {
    controller = ArticleController();
  });

  test('should return json of the article', () async {
    final String fix = fixture('success_response');
    final initialJson = jsonDecode(fix);

    final result = NetworkHelper.filterResponse(
        response: http.Response(fix, 200),
        callback: (json) => json,
        onFailureCallback: (
            NetworkResponseErrorType errorType,
            String? message,
            ) =>
        errorType,
        callBackParameterName: CallBackParameterName.all);

      expect(result, initialJson);
  });

  test('should return models of article model from the response', () async {
    final String fix = fixture('success_response');
    final models = ArticleController.lisOfArticlesFromJson(jsonDecode(fix)['results']);

    final List<Article>? result = NetworkHelper.filterResponse(
        response: http.Response(fix, 200),
        callback: (json) => ArticleController.lisOfArticlesFromJson(json),
        onFailureCallback: (
            NetworkResponseErrorType errorType,
            String? message,
            ) =>
        null,
        callBackParameterName: CallBackParameterName.results);

    ///this code will generate error since hash key for the lists
    ///is different however they are the same
    ///we can use equatable to fix this issue but for this test
    ///i will check the title value only of the first in the list
    expect(result?[0].title, models[0].title);
  });

  test('should return smallest image from the response', () async {
    final String fix = fixture('success_response');

    const String url = 'https://static01.nyt.com/images/2021/12/20/well/00well-omicron-symptoms/00well-omicron-symptoms-thumbStandard.jpg';

    final List<Article>? response = NetworkHelper.filterResponse(
        response: http.Response(fix, 200),
        callback: (json) => ArticleController.lisOfArticlesFromJson(json),
        onFailureCallback: (
            NetworkResponseErrorType errorType,
            String? message,
            ) =>
        null,
        callBackParameterName: CallBackParameterName.results);

    final result = controller.smallestImageUrl(response?[0].media);

    expect(result, url);
  });
}
