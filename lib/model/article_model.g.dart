// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      uri: json['uri'] as String,
      url: json['url'] as String,
      id: json['id'] as int,
      assetId: json['asset_id'] as int,
      source: json['source'] as String,
      title: json['title'] as String,
      publishedDate: json['published_date'] as String,
      updated: json['updated'] as String,
      section: json['section'] as String,
      subsection: json['subsection'] as String,
      adxKeywords: json['adx_keywords'] as String,
      byLine: json['byline'] as String,
      type: json['type'] as String,
      abstract: json['abstract'] as String,
      desFacet:
          (json['des_facet'] as List<dynamic>).map((e) => e as String).toList(),
      media: (json['media'] as List<dynamic>)
          .map((e) => ArticleMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
