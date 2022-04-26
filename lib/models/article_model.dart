class Article {
  final String user;
  final String title;
  final String content;
  final String keyWord;
  final bool isDeleted;
  final DateTime createdAt;
  final String img;

  Article(
    this.user,
    this.title,
    this.content,
    this.keyWord,
    this.isDeleted,
    this.createdAt,
    this.img,
  );
}
