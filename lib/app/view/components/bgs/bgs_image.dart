import 'package:boost_grade_start/app/l10n/l10n.dart';
import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:boost_grade_start/util/debug.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BgsImage extends StatelessWidget {
  const BgsImage({
    Key? key,
    required this.url,
    this.fit = BoxFit.none,
    this.width = double.infinity,
    this.height = double.infinity,
  }) : super(key: key);

  final String? url;
  final BoxFit fit;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      fit: fit,
      width: width,
      height: height,
      errorWidget: (_, __, error) => _NoImageLabel(error),
    );
  }
}

class _NoImageLabel extends StatelessWidget {
  const _NoImageLabel(this.error);

  final dynamic error;

  @override
  Widget build(BuildContext context) {
    out(error);
    return Container(
      color: context.colorTheme.theme.primaryColorLight,
      alignment: Alignment.center,
      child: Text(context.l10n.noImageLabel),
    );
  }
}
