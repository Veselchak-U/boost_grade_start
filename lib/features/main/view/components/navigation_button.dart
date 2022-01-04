import 'package:boost_grade_start/app/theme/app_color_theme.dart';
import 'package:boost_grade_start/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    Key? key,
    required this.label,
    this.routeName,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
  }) : super(key: key);

  final String label;
  final String? routeName;
  final EdgeInsetsGeometry margin;

  void _onTap(BuildContext context) {
    if (routeName != null) {
      Navigator.pushNamed(context, routeName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextTheme.of(context);
    final colorTheme = AppColorTheme.of(context);
    final borderRadius = BorderRadius.circular(8);
    return Container(
      height: 48,
      margin: margin,
      decoration: BoxDecoration(
        color: colorTheme.theme.primaryColor,
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onTap(context),
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: textTheme.s16w4,
                ),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ),
    );
  }
}