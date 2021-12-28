import 'package:new_york_times_articles/model/article_media_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsController {
  String? getLargestImage(List<ArticleMedia>? mediaList) {
    if (mediaList == null || mediaList.isEmpty) return null;
    final media = mediaList.firstWhere((element) =>
        element.metaData.any((e) => e.format == 'mediumThreeByTwo440'));
    if (media.metaData.isEmpty) return null;
    final MediaMetaData largestMetaData = media.metaData
        .firstWhere((element) => element.format == 'mediumThreeByTwo440');

    return largestMetaData.url;
  }

  String getUpdatedDateTrimmed(String updated) => updated.split(' ')[0];

  void openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
