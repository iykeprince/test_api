import 'package:flutter/cupertino.dart';
import 'package:uplanit_api_test/core/models/post.dart';
import 'package:uplanit_api_test/core/services/post_service.dart';

class PostModel extends ChangeNotifier {
  PostService postService = PostService();

  List<Post> _posts;
  List<Post> get posts => _posts;

  bool _loading = false;
  bool get loading => _loading;

  void setPosts(List<Post> posts) {
    _posts = posts;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Future<List<Post>> fetchPosts() async {
    return await postService.fetchPosts();
  }
}
