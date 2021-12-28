import 'package:flutter/material.dart';
import 'package:new_york_times_articles/model/article_model.dart';
import 'package:new_york_times_articles/widgets/article_build_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.articles});

  final List<Article> articles;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  Widget buildResultsAndSuggestions() {
    List<Article> matchQuery = [];
    for (final Article article in articles) {
      if (article.title.toLowerCase().contains(query.toLowerCase()) ||
          article.byLine.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(article);
      }
    }

    return ArticleBuildWidget(articles: matchQuery);
  }
}
