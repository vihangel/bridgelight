// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
      author: json['author'] as String?,
      title: json['title'] as String?,
      yearStart: json['year-start'] as int?,
      yearFinish: json['year-finish'] as int?,
      rating: json['rating'] as int?,
      available: json['available'] as bool?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'year-start': instance.yearStart,
      'year-finish': instance.yearFinish,
      'rating': instance.rating,
      'available': instance.available,
      'limit': instance.limit,
      'offset': instance.offset,
    };
