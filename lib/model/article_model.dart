import 'package:json_annotation/json_annotation.dart';
import 'package:new_york_times_articles/model/article_media_model.dart';

part 'article_model.g.dart';

@JsonSerializable(createToJson: false)
class Article {
  final String uri;
  final String url;
  final int id;
  @JsonKey(name: 'asset_id')
  final int assetId;
  final String source;
  final String title;
  @JsonKey(name: 'published_date')
  final String publishedDate;
  final String updated;
  final String section;
  final String subsection;
  @JsonKey(name: 'adx_keywords')
  final String adxKeywords;
  @JsonKey(name: 'byline')
  final String byLine;
  final String type;
  final String abstract;
  @JsonKey(name: 'des_facet')
  final List<String> desFacet;
  @JsonKey(name: 'media')
  final List<ArticleMedia> media;

  Article(
      {required this.uri,
      required this.url,
      required this.id,
      required this.assetId,
      required this.source,
      required this.title,
      required this.publishedDate,
      required this.updated,
      required this.section,
      required this.subsection,
      required this.adxKeywords,
      required this.byLine,
      required this.type,
      required this.abstract,
      required this.desFacet,
      required this.media});

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
