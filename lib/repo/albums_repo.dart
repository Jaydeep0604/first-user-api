import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:first_user_api/config/constant.dart';
import 'package:first_user_api/models/albums_model.dart';
import 'package:http/http.dart' as http;


abstract class AlbumsRepo {
  Future<List<AlbumsModel>> getAlbumsData();
}

class AlbumsImpl extends AlbumsRepo {
  final Dio _dio = Dio();

  @override
  Future<List<AlbumsModel>> getAlbumsData() async {
    String url = ApiConstant.ALBUMSDATA_URl;
    http.Response response = (await http.get(Uri.parse(url)));
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      List<AlbumsModel> s =
          List.from((data as List).map((e) => AlbumsModel.fromJson(e)));
      return s;
    } else {
      throw Exception();
    }
  }
}
