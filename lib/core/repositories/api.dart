import 'package:http/http.dart' as http;
import 'package:uplanit_api_test/core/enums/request_type.dart';

abstract class Api {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<http.Response> request({
    RequestType requestType,
    String path,
    dynamic parameter,
    String token,
  });
}
