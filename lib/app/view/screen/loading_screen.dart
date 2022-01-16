import 'package:boost_grade_start/app/view/components/bgs/bgs_progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 100),
            FlutterLogo(size: 100),
            SizedBox(
              height: 100,
              child: BgsProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
