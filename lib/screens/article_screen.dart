import 'package:flutter/material.dart';
import 'package:new_york_times_articles/delegates/article_search_delegate.dart';
import 'package:new_york_times_articles/model/article_model.dart';
import 'package:new_york_times_articles/widgets/article_build_widget.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key, required this.articles}) : super(key: key);
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times Most Popular'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(articles: articles),
                  ),
              icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      drawer: const Drawer(),
      body: ArticleBuildWidget(articles: articles),
    );
  }
}
