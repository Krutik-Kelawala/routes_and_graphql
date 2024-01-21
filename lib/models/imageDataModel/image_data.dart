import 'dart:convert';

ImageDataModel imageDataModelFromJson(String str) => ImageDataModel.fromJson(json.decode(str));

String imageDataModelToJson(ImageDataModel data) => json.encode(data.toJson());

class ImageDataModel {
  bool success;
  int totalPhotos;
  String message;
  int offset;
  int limit;
  List<Photo> photos;

  ImageDataModel({
    required this.success,
    required this.totalPhotos,
    required this.message,
    required this.offset,
    required this.limit,
    required this.photos,
  });

  factory ImageDataModel.fromJson(Map<String, dynamic> json) => ImageDataModel(
        success: json["success"] ?? false,
        totalPhotos: json["total_photos"] ?? 0,
        message: json["message"] ?? "",
        offset: json["offset"] ?? 0,
        limit: json["limit"] ?? 0,
        photos: json["photos"] != null ? List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "total_photos": totalPhotos,
        "message": message,
        "offset": offset,
        "limit": limit,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}

class Photo {
  String url;
  int user;
  String title;
  int id;
  String description;

  Photo({
    required this.url,
    required this.user,
    required this.title,
    required this.id,
    required this.description,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json["url"] ?? "",
        user: json["user"] ?? 0,
        title: json["title"] ?? "",
        id: json["id"] ?? 0,
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "user": user,
        "title": title,
        "id": id,
        "description": description,
      };

  @override
  String toString() {
    return 'Photo{url: $url, user: $user, title: $title, id: $id, description: $description}';
  }
}
