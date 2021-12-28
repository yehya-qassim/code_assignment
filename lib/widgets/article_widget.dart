import 'package:flutter/material.dart';
import 'package:new_york_times_articles/model/article_model.dart';
import 'package:new_york_times_articles/model/article_media_model.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
      {Key? key,
      required this.article,
      required this.onTap,
      required this.smallestImage})
      : super(key: key);

  final Article article;
  final void Function() onTap;
  final String? Function(List<ArticleMedia>?) smallestImage;

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = smallestImage(article.media);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title,
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(article.byLine,
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(article.source,
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      const Spacer(),
                      const Icon(
                        Icons.calendar_today_sharp,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(article.publishedDate,
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
