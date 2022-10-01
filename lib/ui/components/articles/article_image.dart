import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    Key? key,
    required this.imgURL,
    required this.size,
  }) : super(key: key);

  final String imgURL;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24.0),
        bottomRight: Radius.circular(24.0),
      ),
      child: FadeInImage(
        placeholder: const AssetImage('assets/images/Profile.jpg'),
        image: NetworkImage(imgURL),
        height: size.height * 0.2,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
