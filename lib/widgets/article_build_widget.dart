import 'package:flutter/material.dart';
import 'package:new_york_times_articles/controllers/article_controller.dart';
import 'package:new_york_times_articles/model/article_model.dart';
import 'package:new_york_times_articles/model/article_media_model.dart';

import 'article_widget.dart';

class ArticleBuildWidget extends StatelessWidget {
  ArticleBuildWidget({Key? key, required this.articles}) : super(key: key);

  final List<Article> articles;
  final ArticleController _controller = ArticleController();

  @override
  Widget build(BuildContext context) {
    final String? Function(List<ArticleMedia>?) smallestImage =
        _controller.smallestImageUrl;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ArticleWidget(
          article: articles[index],
          onTap: () => _controller.onTap(context, articles[index]),
          smallestImage: smallestImage,
        );
      },
      itemCount: articles.length,
    );
  }
}
