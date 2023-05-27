// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBookModel _$CreateBookModelFromJson(Map<String, dynamic> json) =>
    CreateBookModel(
      id: json['id'] as String?,
      cover: json['cover'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      synopsis: json['synopsis'] as String,
      year: json['year'] as int,
      rating: (json['rating'] as num).toDouble(),
      available: json['available'] as bool,
    );

Map<String, dynamic> _$CreateBookModelToJson(CreateBookModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['cover'] = instance.cover;
  val['title'] = instance.title;
  val['author'] = instance.author;
  val['synopsis'] = instance.synopsis;
  val['year'] = instance.year;
  val['rating'] = instance.rating;
  val['available'] = instance.available;
  return val;
}
