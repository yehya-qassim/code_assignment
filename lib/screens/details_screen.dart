import 'package:flutter/material.dart';
import 'package:new_york_times_articles/controllers/details_controller.dart';
import 'package:new_york_times_articles/model/article_model.dart';
import 'package:new_york_times_articles/widgets/c_network_image.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.article}) : super(key: key);

  final Article article;

  final DetailsController controller = DetailsController();

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = controller.getLargestImage(article.media);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageUrl != null
                ? CNetworkImage(
                    imageUrl,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                  )
                : Container(
                    height: 300,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                  ),
            const SizedBox(height: 20,),
            articleInfo(),
            const SizedBox(height: 30,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).backgroundColor
                  ),
                  onPressed: () {
                    controller.openUrl(article.url);
                  },
                  child: const Text('Open in browser'),
                ),
              ),
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }

  TextStyle _getStyle(
      {double size = 16,
        FontWeight weight = FontWeight.normal,
        Color color = Colors.black}) =>
      TextStyle(fontSize: size, fontWeight: weight, color: color);

  Widget articleInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title,
            style: _getStyle(size: 20, weight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
          Text(
            article.byLine,
            style: _getStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text(
                'Published ${article.publishedDate}',
                style: _getStyle(color: Colors.grey),
              ),
              const Spacer(),
              Text(
                'Updated ${controller.getUpdatedDateTrimmed(article.updated)}',
                style: _getStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Divider(thickness: 1, height: 10, color: Colors.grey,),
          const SizedBox(height: 10,),
          Center(
            child: Text(
              'Article Abstract',
              style: _getStyle(size: 18, weight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10,),
          const Divider(thickness: 1, height: 10, color: Colors.grey,),
          const SizedBox(height: 10,),
          Text(
            article.abstract,
            style: _getStyle(size: 17),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
