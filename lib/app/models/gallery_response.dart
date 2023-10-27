import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'gallery_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GalleryResponse {
  List<DataGallery>? data;

  GalleryResponse({this.data});

  factory GalleryResponse.fromJson(List<dynamic> json) =>
      _$GalleryResponseFromJson(json);
}

class DataGallery {
  int? id;
  String? title;
  String? description;
  String? author;
  String? createdAt;
  String? updatedAt;
  String? image;

  DataGallery(
      {this.id,
      this.title,
      this.description,
      this.author,
      this.createdAt,
      this.updatedAt,
      this.image});

  factory DataGallery.fromMap(Map<String, dynamic> map) {
    return DataGallery(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      author: map['author'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      image: map['image'],
    );
  }

  factory DataGallery.fromJson(String source) =>
      DataGallery.fromMap(json.decode(source));
}
