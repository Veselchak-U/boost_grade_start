import 'package:flutter/material.dart';

class BgsSnakeBar {
  BgsSnakeBar(
    BuildContext context,
    dynamic message,
  ) {
    _showSnakeMessage(context, message);
  }

  BgsSnakeBar.error(
    BuildContext context,
    dynamic message,
  ) {
    final color = Colors.red[500] as Color;
    _showSnakeMessage(context, message, color);
  }

  void _showSnakeMessage(
    BuildContext context,
    dynamic message, [
    Color? color,
  ]) {
    final snackBar = SnackBar(
      content: Text('$message'),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.removeCurrentSnackBar();
    scaffold.showSnackBar(snackBar);
  }
}
