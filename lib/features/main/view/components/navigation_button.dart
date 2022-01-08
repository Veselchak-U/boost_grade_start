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
    return Padding(
      padding: margin,
      child: TextButton(
        onPressed: () => _onTap(context),
        style: context.colorTheme.navigationButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: context.textTheme.s16w4,
            ),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
