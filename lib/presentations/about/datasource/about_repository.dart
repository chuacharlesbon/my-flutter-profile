
import 'package:myflutterprofile/presentations/about/datasource/about_datasource.dart';
import 'package:myflutterprofile/presentations/about/datasource/about_model.dart';

class AboutRepository {
  final aboutDataSource = AboutDataSource();

  Future<List<About2Model>> getData1() async {
    try {
      final result = await aboutDataSource.getData1();

      return result.map((e) => About2Model.fromJson(e)).toList();
    } catch (e) {
      //throw Exception("Failed to load data");
      return [];
    }
  }

  Future<dynamic> getData2({
    required String patronID
  }) async {
    try {
      final result = await aboutDataSource.getData2(
        patronID: patronID
      );

      return result.map((e) => AboutModel.fromJson(e)).toList();
    } catch (e) {
      // throw Exception("Failed to load data");
      return "Failed to load data";
    }
  }
}