import 'package:flutter/material.dart';
import 'package:homely_app/providers/articles_list_provider.dart';
import 'package:homely_app/providers/auth_provider.dart';
import 'package:homely_app/ui/components/articles/article_thumbnail_box.dart';
import 'package:homely_app/ui/components/custom_app_bar.dart';
import 'package:homely_app/ui/components/search_text_field.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  static String get name => '/articles';

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  late final AuthProvider _authProvider;
  final ScrollController _scrollController = ScrollController();

  //Pull to resfresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
    //First load of the articles
    final ArticlesListProvider _articlesListProvider =
        Provider.of<ArticlesListProvider>(context, listen: false);
    if (_articlesListProvider.firstLoadDone == false) {
      _articlesListProvider.getArticles(_authProvider.token);
    }

    //Scroll controller
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('Leegams!!!!');
        _articlesListProvider.getArticles(_authProvider.token);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ArticlesListProvider _articlesListProvider =
        Provider.of<ArticlesListProvider>(context);

    final _currentUser = _authProvider.currentUser;
    final _currentBuilding = _authProvider.currentBuilding;

    Future<void> _onRefresh() async {
      _articlesListProvider.firstLoadDone = false;
      await _articlesListProvider.getArticles(_authProvider.token);

      _refreshController.refreshCompleted();
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Noticias',
        subtitle: '${_currentBuilding.name} - ${_currentUser.unit}',
        hasBackButton: true,
      ),
      body: _articlesListProvider.firstLoadDone == false
          ? Center(
              child: LottieBuilder.asset('assets/lottie/loadingAnimation.json'),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchTextField(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: CustomThemes.horizontalPadding),
                  child: Text(
                    'Hay ${_articlesListProvider.totalArticles} Noticias en tu conjunto:',
                    textAlign: TextAlign.start,
                    style: paragraph7,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SmartRefresher(
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
                      physics: const BouncingScrollPhysics(),
                      itemCount: _articlesListProvider.articles.length,
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (_, index) => ArticleThumbnailBox(
                          article: _articlesListProvider.articles[index]),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
