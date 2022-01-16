import 'package:boost_grade_start/features/async_call/provider/data_provider.dart';

class AsyncCallScreenRoute {
  static const name = 'AsyncCallScreenRoute';
}

class AsyncCallScreenRouteArgs {
  final DataProvider dataProvider;

  AsyncCallScreenRouteArgs(this.dataProvider);
}
