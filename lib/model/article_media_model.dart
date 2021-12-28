import 'package:json_annotation/json_annotation.dart';

part 'article_media_model.g.dart';

@JsonSerializable(createToJson: false)
class ArticleMedia {
  final String type;
  final String subtype;
  final String caption;
  final String copyright;
  @JsonKey(name: 'approved_for_syndication')
  final int approvedForSyndication;
  @JsonKey(name: 'media-metadata')
  final List<MediaMetaData> metaData;

  ArticleMedia(
      {required this.type,
      required this.subtype,
      required this.caption,
      required this.copyright,
      required this.approvedForSyndication,
      required this.metaData});

  factory ArticleMedia.fromJson(Map<String, dynamic> json) =>
      _$ArticleMediaFromJson(json);
}

@JsonSerializable(createToJson: false)
class MediaMetaData {
  final String url;
  final String format;
  final int height;
  final int width;

  MediaMetaData(
      {required this.url,
      required this.format,
      required this.height,
      required this.width});

  factory MediaMetaData.fromJson(Map<String, dynamic> json) =>
      _$MediaMetaDataFromJson(json);
}
