import 'package:flutter/material.dart';

class BgsProgressIndicator extends StatelessWidget {
  const BgsProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
