import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:new_york_times_articles/controllers/article_controller.dart';
import 'package:new_york_times_articles/controllers/details_controller.dart';
import 'package:new_york_times_articles/model/article_model.dart';
import 'package:new_york_times_articles/network/network_helper.dart';
import 'package:new_york_times_articles/network/network_enums.dart';

import '../fixture/fixture_reader.dart';

void main() {
  late DetailsController controller;

  setUp(() {
    controller = DetailsController();
  });

  test('should return largest image from the response', () async {
    final String fix = fixture('success_response');

    const String url = 'https://static01.nyt.com/images/2021/12/20/well/00well-omicron-symptoms/00well-omicron-symptoms-mediumThreeByTwo440.jpg';

    final List<Article>? response = NetworkHelper.filterResponse(
        response: http.Response(fix, 200),
        callback: (json) => ArticleController.lisOfArticlesFromJson(json),
        onFailureCallback: (
            NetworkResponseErrorType errorType,
            String? message,
            ) =>
        null,
        callBackParameterName: CallBackParameterName.results);

    final result = controller.getLargestImage(response?[0].media);

    expect(result, url);
  });

  test('should return updated as 2021-12-27', () async {
    final String fix = fixture('success_response');

    const String updated = '2021-12-27';

    final List<Article>? response = NetworkHelper.filterResponse(
        response: http.Response(fix, 200),
        callback: (json) => ArticleController.lisOfArticlesFromJson(json),
        onFailureCallback: (
            NetworkResponseErrorType errorType,
            String? message,
            ) =>
        null,
        callBackParameterName: CallBackParameterName.results);

    final result = controller.getUpdatedDateTrimmed(response![0].updated);

    expect(result, updated);
  });
}
