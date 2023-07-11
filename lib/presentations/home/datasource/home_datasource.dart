import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeDataSource {
  final Dio dio = Dio();

  // Access .env values
  final String serverUrl = dotenv.env['API'] ?? '';
  final String appCode = dotenv.env['APP_CODE'] ?? '';
  
  Future<dynamic> getData1() async {

    // Declare variable
    dynamic result;

    try {
      Response response = await dio.get(
        '$serverUrl/route-one',
        options: Options(headers: {
          "x-app-code": appCode
        })
      );

      // Assigning value when status code 200
      result = response.data;

    } on DioException catch (e) {
      if (e.response != null) {

        // Assigning value when error
        //result = null;
        //result = e.response?.data;
        //result = 'ERROR: ${e.response?.data}';

        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {

        // Assigning value when error
        //result = null;
        //result = 'Error sending request!';
        //result = e.message;

        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      // During debug use throw
      // throw Exception('Something went wrong');

      // On Deployment, assigning value even on error to complete the process of API request (optional)
      result = null;
    }
    return result;
  }

  Future<List<dynamic>> getData2({
    required String patronID
  }) async {
    dynamic result;
    try {
      Response response = await dio.get(
        '$serverUrl/route-two',
        options: Options(headers: {
          "x-app-code": appCode
        })
      );
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = null;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = null;
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = null;
    }
    return result;
  }

  Future<dynamic> getData3({
    required String patronID,
    required String deviceID,
  }) async {
    dynamic result;
    try {
      Response response = await dio.post(
        '$serverUrl/route-three',
        data: {
          "patron_id": patronID,
          "device_id": deviceID
        },
        options: Options(headers: {
          "x-app-code": appCode
        })
      );
      result = response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        result = null;
        debugPrint('Dio error!');
        debugPrint('STATUS: ${e.response?.statusCode}');
        debugPrint('DATA: ${e.response?.data}');
        debugPrint('HEADERS: ${e.response?.headers}');
      } else {
        result = null;
        debugPrint('Error sending request!');
        debugPrint(e.message);
      }
    } catch (e) {
      result = null;
    }
    return result;
  }
}
