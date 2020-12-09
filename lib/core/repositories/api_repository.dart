import 'package:uplanit_api_test/core/enums/request_type.dart';

import 'package:http/src/response.dart';

import 'api.dart';

import 'package:http/http.dart' as http;

class ApiRepository extends Api {
  var client = http.Client();

  @override
  Future<Response> request({
    RequestType requestType,
    String path,
    dynamic parameter,
    String token,
  }) {
    switch (requestType) {
      case RequestType.GET:
        return client.get(Api.baseUrl + path,
            headers: {'Content-Type': 'application/json'});
      case RequestType.POST:
        return client.post(
          Api.baseUrl + path,
          headers: {
            "Content-Type": "application/json",
          },
          body: parameter,
        );
      case RequestType.PUT:
        return client.put(
          Api.baseUrl + path,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "bearer $token",
          },
          body: parameter,
        );
      case RequestType.PATCH:
        return client.patch(
          Api.baseUrl + path,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "bearer $token",
          },
          body: parameter,
        );
      case RequestType.DELETE:
        return client.delete(
          Api.baseUrl + path,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "bearer $token",
          },
        );
      default:
        return null;
    }
  }
}
