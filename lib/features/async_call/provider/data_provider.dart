import 'package:boost_grade_start/features/async_call/model/photo_model.dart';

abstract class DataProvider {
  Future<List<PhotoModel>?> getPhotos();
}
