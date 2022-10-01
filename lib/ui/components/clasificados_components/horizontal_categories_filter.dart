import 'package:flutter/material.dart';
import 'package:homely_app/ui/components/category_filter_box.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HorizontalCategoryFilters extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;

  const HorizontalCategoryFilters({
    Key? key,
    required this.options,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: CustomThemes.horizontalPadding),
        itemCount: options.length,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (_, index) => CategoryFilterBox(
            text: options[index], isSelected: selectedIndex == index),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
