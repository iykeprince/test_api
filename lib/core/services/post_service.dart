import 'package:uplanit_api_test/core/enums/request_type.dart';
import 'package:uplanit_api_test/core/repositories/api_repository.dart';
import 'package:uplanit_api_test/core/utils/api_endpoints.dart';

class PostService {
  ApiRepository apiRepository = ApiRepository();

  //function that fetches the post from api
  Future<void> fetchPosts() async {
    final response = await apiRepository.request(
      requestType: RequestType.GET,
      path: ApiEndpoint.GET_POSTS,
    );
    //status code
    print('status code: ${response.statusCode}');
    print('body: ${response.body}');

  }
}
