import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable(includeIfNull: false)
class BookModel extends Equatable {
  final int id;
  final String title;
  final String author;
  final int year;
  final String? cover;
  final String synopsis;
  final int idStore;
  final double rating;
  final bool available;

  const BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.year,
    required this.cover,
    required this.synopsis,
    required this.idStore,
    required this.rating,
    required this.available,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);

  copyWith({
    int? id,
    String? title,
    String? author,
    int? year,
    String? cover,
    String? synopsis,
    int? idStore,
    double? rating,
    bool? available,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      year: year ?? this.year,
      cover: cover ?? this.cover,
      synopsis: synopsis ?? this.synopsis,
      idStore: idStore ?? this.idStore,
      rating: rating ?? this.rating,
      available: available ?? this.available,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        year,
        cover,
        synopsis,
        idStore,
        rating,
        available,
      ];
}
