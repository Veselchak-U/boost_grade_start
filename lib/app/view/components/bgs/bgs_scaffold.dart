import 'package:flutter/material.dart';

class BgsScaffold extends Scaffold {
  const BgsScaffold({
    PreferredSizeWidget? appBar,
    Widget? body,
    Widget? floatingActionButton,
  }) : super(
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
        );

  @override
  FloatingActionButtonLocation? get floatingActionButtonLocation =>
      const _CustomFabLocation();
}

class _CustomFabLocation extends StandardFabLocation {
  static const _customPaddingX = 16;
  static const _customPaddingY = 45;

  const _CustomFabLocation();

  @override
  double getOffsetX(
    ScaffoldPrelayoutGeometry scaffoldGeometry,
    double adjustment,
  ) {
    return scaffoldGeometry.scaffoldSize.width -
        scaffoldGeometry.floatingActionButtonSize.width +
        adjustment -
        _customPaddingX;
  }

  @override
  double getOffsetY(
    ScaffoldPrelayoutGeometry scaffoldGeometry,
    double adjustment,
  ) {
    return scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.floatingActionButtonSize.height +
        adjustment -
        _customPaddingY;
  }

  @override
  String toString() => 'FloatingActionButtonLocation.custom';
}
