import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:first_user_api/config/constant.dart';
import 'package:first_user_api/models/user_model.dart';
import 'package:http/http.dart'as http;
abstract class UserRepo {
  Future<List<UserModel>> getUserData();
}

class UserImpl extends UserRepo {
  final Dio _dio = Dio();
  @override
  Future<List<UserModel>> getUserData() async {
    String url = ApiConstant.USERDATA_URl;
    http.Response response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      List<UserModel> s =
          List.from((data as List).map((e) => UserModel.fromJson(e)));
      return s;
    } else {
      throw Exception();
    }
  }
}

// class ApiProvider {
//   final Dio _dio = Dio();
//   final String _url = ApiConstant.USERDATA_URl;

//   Future<UserModel> userdtaa() async {
//     try {
//       Response response = await _dio.get(_url);
//       return UserModel.fromJson(response.data);
//     } 
//     catch (Ex){
//       throw Exception("User data not avible ..");
//     }
//   }
// }
// class ApiRepository {
//   final _provider = ApiProvider();

//   Future<UserModel> userdata() {
//     return _provider.userdtaa();
//   }
// }
