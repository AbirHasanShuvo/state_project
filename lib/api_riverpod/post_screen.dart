import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_project/api_riverpod/model.dart';
import 'package:state_project/api_riverpod/post_provider.dart';

class ApiScreen extends ConsumerWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final json = {
            'id': 1,
            'userId': 1,
            'body': 'Abir is a good mobile app developer from Bangladesh',
            'title': 'Md. Abir Hasan',
          };

          PostModel postModel = PostModel.fromJson(json);

          print(postModel.body);
        },
        child: Icon(Icons.add),
      ),

      body: post.when(
        data: (post) {
          return ListView.builder(
            itemCount: post.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(post[index].title),
                subtitle: Text(
                  post[index].body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                leading: Text(post[index].id.toString()),
              );
            },
          );
        },
        error: (error, stack) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
