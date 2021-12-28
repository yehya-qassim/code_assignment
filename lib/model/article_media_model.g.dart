// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleMedia _$ArticleMediaFromJson(Map<String, dynamic> json) => ArticleMedia(
      type: json['type'] as String,
      subtype: json['subtype'] as String,
      caption: json['caption'] as String,
      copyright: json['copyright'] as String,
      approvedForSyndication: json['approved_for_syndication'] as int,
      metaData: (json['media-metadata'] as List<dynamic>)
          .map((e) => MediaMetaData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MediaMetaData _$MediaMetaDataFromJson(Map<String, dynamic> json) =>
    MediaMetaData(
      url: json['url'] as String,
      format: json['format'] as String,
      height: json['height'] as int,
      width: json['width'] as int,
    );
