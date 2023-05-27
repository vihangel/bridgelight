import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel extends Equatable {
  final String? banner;
  final int idStore;
  final String name;
  final String slogan;

  const StoreModel({
    this.banner,
    required this.idStore,
    required this.name,
    required this.slogan,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);

  @override
  List<Object?> get props => [banner, idStore, name, slogan];
}
