import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

final postProvider = FutureProvider<List<PostModel>>((ref) async {
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      List<PostModel> postsList = data
          .map((e) => PostModel.fromJson(e))
          .toList();
      return postsList;
    } else {
      throw 'Something went wrong';
    }
  } catch (error) {
    rethrow;
  }
});
