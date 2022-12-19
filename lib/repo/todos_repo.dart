import 'dart:convert';
import 'package:first_user_api/models/todos_model.dart';
import 'package:http/http.dart' as http;
import '../config/constant.dart';

abstract class TodosRepo {
  Future<List<TodosModel>> getTodosData();
}

class TodosImpl extends TodosRepo {
  @override
  Future<List<TodosModel>> getTodosData() async {
    String url = ApiConstant.TODOSDATA_URl;
    http.Response response = (await http.get(Uri.parse(url)));

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      List<TodosModel> s =
          List.from((data as List).map((e) => TodosModel.fromJson(e)));
      return s;
    } else {
      throw Exception();
    }
  }
}
