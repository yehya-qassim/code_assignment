import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:new_york_times_articles/controllers/article_controller.dart';
import 'package:new_york_times_articles/screens/details_screen.dart';
import 'package:new_york_times_articles/widgets/c_network_image.dart';

import '../fixture/fixture_reader.dart';

void main() {
  final fix = fixture('success_response');
  final articles =
  ArticleController.lisOfArticlesFromJson(jsonDecode(fix)['results']);

  testWidgets('Details screen widget test', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MaterialApp(
          home: DetailsScreen(
            article: articles[0],
          )));

      final image = find.byType(CNetworkImage);
      final text = find.byType(Text);
      final button = find.byType(ElevatedButton);

      expect(image, findsOneWidget);
      expect(text, findsWidgets);
      expect(button, findsOneWidget);
    });
  });
}
