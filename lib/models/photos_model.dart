class PhotosModel {
  int? id;
  final String title;
  final String url;
  final String thumbnailUrl;
  PhotosModel(
      {required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory PhotosModel.fromJson(Map<String, dynamic> parsedJson) {
    return PhotosModel(
        id: parsedJson['id'],
        title: parsedJson['title'],
        url: parsedJson['url'],
        thumbnailUrl: parsedJson['thumbnailUrl']);
  }
}
