// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      year: json['year'] as int,
      cover: json['cover'] as String?,
      synopsis: json['synopsis'] as String,
      idStore: json['idStore'] as int,
      rating: (json['rating'] as num).toDouble(),
      available: json['available'] as bool,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'author': instance.author,
    'year': instance.year,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cover', instance.cover);
  val['synopsis'] = instance.synopsis;
  val['idStore'] = instance.idStore;
  val['rating'] = instance.rating;
  val['available'] = instance.available;
  return val;
}
