import 'package:flutter/material.dart';

import 'DetailPost.dart';

class ShowListUI extends StatelessWidget {
  List listPost;

  ShowListUI(this.listPost);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listPost == null ? 0 : listPost.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPost(listPost, index)));
                },
                title: Text(
                  listPost[index].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                subtitle: Text(
                  listPost[index].body,
                  maxLines: 2,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        });
  }
}
