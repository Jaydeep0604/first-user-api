class CommentsModel {
  int? id;
  final String name;
  final String email;
  final String body;
  CommentsModel({required this.id,required this.name, required this.email, required this.body});
  factory CommentsModel.fromJson(Map<String, dynamic> parsedJson) {
    return CommentsModel(
        id: parsedJson['id'],
        name: parsedJson['name'],
        email: parsedJson['email'],
        body: parsedJson['body'],
        );
  }
}
