import 'package:uplanit_api_test/core/enums/request_type.dart';
import 'package:uplanit_api_test/core/models/post.dart';
import 'package:uplanit_api_test/core/repositories/api_repository.dart';
import 'package:uplanit_api_test/core/utils/api_endpoints.dart';

class PostService {
  ApiRepository apiRepository = ApiRepository();

  //function that fetches the post from api
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await apiRepository.request(
        requestType: RequestType.GET,
        path: ApiEndpoint.GET_POSTS,
      );
      //status code
      if (response.statusCode == 200) {
        return postListFromJson(response.body);
      }
      return [];
    } catch (e) {
      print('Exception thrown: $e');
      return null;
    }
  }
}
