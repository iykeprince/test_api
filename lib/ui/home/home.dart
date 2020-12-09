import 'package:flutter/material.dart';
import 'package:uplanit_api_test/core/services/post_service.dart';

class Home extends StatelessWidget {
  PostService postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello Dennis'),
            RaisedButton(
              onPressed: () async => await postService.fetchPosts(),
              color: Colors.black,
              child: Text('FETCH POSTS', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
