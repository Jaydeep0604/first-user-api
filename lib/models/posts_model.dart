class PostsModel {
  int? id;
  final String title;
  final String body;

  PostsModel({
    required this.id,
    required this.title, 
    required this.body
    });

  factory PostsModel.fromJson(Map<String, dynamic> parsedJson) {
    return PostsModel(
        id: parsedJson['id'],
        title: parsedJson['title'],
        body: parsedJson['body']);
  }
}
