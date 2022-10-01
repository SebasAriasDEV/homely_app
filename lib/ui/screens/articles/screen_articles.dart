import 'package:flutter/material.dart';
import 'package:homely_app/models/article_model.dart';
import 'package:homely_app/ui/components/articles/article_thumbnail_box.dart';
import 'package:homely_app/ui/components/custom_app_bar.dart';
import 'package:homely_app/ui/components/search_text_field.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  static String get name => '/articles';

  @override
  Widget build(BuildContext context) {
    final List<Article> articles = Article.testingArticles;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Articles',
        subtitle: 'Ilarco 114 - 208 (TN)',
        hasBackButton: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SearchTextField(),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 0.0),
              itemCount: articles.length,
              separatorBuilder: (_, index) => const SizedBox(height: 12),
              itemBuilder: (_, index) =>
                  ArticleThumbnailBox(article: articles[index]),
            ),
          ),
        ],
      ),
    );
  }
}
