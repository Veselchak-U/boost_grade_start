import 'package:flutter/foundation.dart';

void out(dynamic value) {
  if (kDebugMode) {
    print('DEBUG_OUT: $value');
  }
}
