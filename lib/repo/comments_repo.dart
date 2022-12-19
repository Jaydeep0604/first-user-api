import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_user_api/config/constant.dart';
import 'package:first_user_api/models/comments_model.dart';
import 'package:http/http.dart'as http;
abstract class CommentsRepo {
  Future<List<CommentsModel>> getCommentsData();
}

class CommentsImpl extends CommentsRepo {
  final Dio _dio = Dio();

  @override
  Future<List<CommentsModel>> getCommentsData() async {
    String url = ApiConstant.COMMENTSDATA_URl;
    http.Response response = (await http.get(Uri.parse(url)));

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      List<CommentsModel> s =
          List.from((data as List).map((e) => CommentsModel.fromJson(e)));
      return s;
    } else {
      throw Exception();
    }
  }
}