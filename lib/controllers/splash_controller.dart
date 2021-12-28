import 'package:flutter/material.dart';
import 'package:new_york_times_articles/screens/article_screen.dart';
import 'package:new_york_times_articles/screens/error_screen.dart';

import 'article_controller.dart';

class SplashController {
  void getData(BuildContext context) async {
    final articles = await ArticleController.getResponse();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => articles != null
                ? ArticleScreen(articles: articles)
                : const ErrorScreen(text: 'Something wrong happened')));
  }
}
