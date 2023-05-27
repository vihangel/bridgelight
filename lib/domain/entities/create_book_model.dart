import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_book_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateBookModel extends Equatable {
  String? id;
  final String cover;
  final String title;
  final String author;
  final String synopsis;
  final int year;
  final double rating;
  final bool available;

  CreateBookModel({
    this.id,
    required this.cover,
    required this.title,
    required this.author,
    required this.synopsis,
    required this.year,
    required this.rating,
    required this.available,
  });

  @override
  List<Object?> get props =>
      [cover, title, author, synopsis, year, rating, available];

  factory CreateBookModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBookModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBookModelToJson(this);
}
