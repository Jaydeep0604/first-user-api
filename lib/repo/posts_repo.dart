import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_user_api/config/constant.dart';
import 'package:first_user_api/models/posts_model.dart';
import 'package:http/http.dart'as http;
abstract class PostsRepo {
  Future<List<PostsModel>> getPostsData();
}

class PostsImpl extends PostsRepo {
  final Dio _dio = Dio();

  @override
  Future<List<PostsModel>> getPostsData() async {
    String url = ApiConstant.POSTSDATA_URl;
    http.Response response = (await http.get(Uri.parse(url)));
     if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      List<PostsModel> s =
          List.from((data as List).map((e) => PostsModel.fromJson(e)));
      return s;
    } else {
      throw Exception();
    }
  }
}