import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:boost_grade_start/app/theme/app_text_theme.dart';
import 'package:boost_grade_start/app/view/components/bgs/bgs_image.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  final String? url;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          BgsImage(
            height: 207,
            url: url,
          ),
          Container(
            height: 64,
            color: context.colorTheme.theme.primaryColor,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title ?? '',
              style: context.textTheme.photoCardTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
