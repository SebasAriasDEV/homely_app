import 'package:flutter/material.dart';
import 'package:homely_app/ui/components/category_filter_box.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HorizontalCategoryFilters extends StatelessWidget {
  const HorizontalCategoryFilters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: CustomThemes.horizontalPadding),
        itemCount: 5,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (_, index) => const CategoryFilterBox(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
