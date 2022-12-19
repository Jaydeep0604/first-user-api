class TodosModel {
  int? id;
  final String title;
  bool? completed;
  TodosModel({required this.id, required this.title, required this.completed});
  factory TodosModel.fromJson(Map<String, dynamic> parsedJson) {
    return TodosModel(
        id: parsedJson['id'],
        title: parsedJson['title'],
        completed: parsedJson['completed']);
  }
}
