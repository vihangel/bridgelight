import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  @JsonKey(name: 'author')
  final String? author;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'year-start')
  final int? yearStart;

  @JsonKey(name: 'year-finish')
  final int? yearFinish;

  @JsonKey(name: 'rating')
  final int? rating;

  @JsonKey(name: 'available')
  final bool? available;

  @JsonKey(name: 'limit')
  final int? limit;

  @JsonKey(name: 'offset')
  final int? offset;

  FilterModel({
    this.author,
    this.title,
    this.yearStart,
    this.yearFinish,
    this.rating,
    this.available,
    this.limit,
    this.offset,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}
