import 'package:flutter/material.dart';
import 'package:new_york_times_articles/model/article_media_model.dart';
import 'package:new_york_times_articles/screens/details_screen.dart';

import '../model/article_model.dart';
import '../network/network_enums.dart';
import '../network/network_helper.dart';
import '../network/network_service.dart';
import '../network/request_query_parameter.dart';
import '../statics/static_values.dart';

class ArticleController {
  static Future<List<Article>?> getResponse() async {
    final response = await NetworkService.sendRequest(
        uri: StaticValues.apiLink,
        requestType: RequestType.get,
        queryParameters: RequestQP.getAPIKey());

    return NetworkHelper.filterResponse(
        response: response,
        callBackParameterName: CallBackParameterName.results,
        callback: lisOfArticlesFromJson,
        onFailureCallback:
            (NetworkResponseErrorType errorType, String? errorMessage) {
          debugPrint('Error type - $errorType \nError message - $errorMessage');
        });
  }

  static List<Article> lisOfArticlesFromJson(json) => (json as List)
      .map((e) => Article.fromJson(e as Map<String, dynamic>))
      .toList();

  String? smallestImageUrl(List<ArticleMedia>? mediaList) {
    if (mediaList == null || mediaList.isEmpty) return null;
    final media = mediaList.firstWhere((element) =>
        element.metaData.any((e) => e.format == 'Standard Thumbnail'));
    if (media.metaData.isEmpty) return null;
    final MediaMetaData smallestMetaData = media.metaData
        .firstWhere((element) => element.format == 'Standard Thumbnail');
    return smallestMetaData.url;
  }

  void onTap(BuildContext context, Article article) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => DetailsScreen(article: article)));
}
