import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:new_york_times_articles/controllers/article_controller.dart';
import 'package:new_york_times_articles/screens/article_screen.dart';
import 'package:new_york_times_articles/widgets/article_build_widget.dart';

import '../fixture/fixture_reader.dart';

void main() {
  final fix = fixture('success_response');
  final articles =
      ArticleController.lisOfArticlesFromJson(jsonDecode(fix)['results']);

  testWidgets('Article screen widget test', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp(
          home: ArticleScreen(
        articles: articles,
      )));

      final text = find.text('NY Times Most Popular');
      final icons = find.byType(IconButton);
      final buildWidget = find.byType(ArticleBuildWidget);

      expect(text, findsOneWidget);
      expect(icons, findsWidgets);
      expect(buildWidget, findsOneWidget);
    });
  });
}
