import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_user_api/config/constant.dart';
import 'package:first_user_api/models/photos_model.dart';
import 'package:http/http.dart'as http;
abstract class PhotosRepo {
  Future<List<PhotosModel>> getPhotosData();
}

class PhotosImpl extends PhotosRepo {
  final Dio _dio = Dio();

  @override
  Future<List<PhotosModel>> getPhotosData() async {
    String url = ApiConstant.PHOTOSDATA_URl;
    http.Response response = (await http.get(Uri.parse(url)));

     if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      List<PhotosModel> s =
          List.from((data as List).map((e) => PhotosModel.fromJson(e)));
      return s;
    } else {
      throw Exception();
    }
  }
}