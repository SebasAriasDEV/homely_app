import 'package:flutter/material.dart';

class ThumbnailImage extends StatelessWidget {
  const ThumbnailImage({
    Key? key,
    required this.imgURL,
  }) : super(key: key);

  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: Image.network(
        imgURL,
        fit: BoxFit.cover,
        height: 108,
        width: 108,
      ),
    );
  }
}