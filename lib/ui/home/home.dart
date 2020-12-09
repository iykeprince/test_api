import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uplanit_api_test/core/models/post.dart';
import 'package:uplanit_api_test/core/viewmodels/post_model.dart';

class Home extends StatelessWidget {
  PostModel postModel;
  @override
  Widget build(BuildContext context) {
    postModel = Provider.of<PostModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('FAKE API'),
        actions: [
          RaisedButton(
            onPressed: () async {
              postModel.setLoading(true);
              List<Post> posts = await postModel.fetchPosts();
              if (posts != null) {
                postModel.setPosts(posts);
              } else {
                print('Error Message: Post was not fetched');
                postModel.setPosts([]);
              }
              postModel.setLoading(false);
            },
            color: Colors.black,
            child: Text('FETCH POSTS', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: postModel.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: postModel.posts.length,
              itemBuilder: (context, index) =>
                  _buildItem(context, index, postModel.posts),
            ),
    );
  }

  _buildItem(BuildContext context, int index, List<Post> posts) {
    return ListTile(
      title: Text(
        posts[index].title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        posts[index].body,
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.black54,
        ),
      ),
      leading: CircleAvatar(
        child: Text('${posts[index].id}'),
      ),
    );
  }
}
