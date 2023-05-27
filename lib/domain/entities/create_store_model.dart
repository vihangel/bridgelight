import 'package:json_annotation/json_annotation.dart';

part 'create_store_model.g.dart';

@JsonSerializable()
class StoreWithAdminModel {
  final String name;
  final String slogan;
  final String banner;
  final Admin admin;

  StoreWithAdminModel({
    required this.name,
    required this.slogan,
    required this.banner,
    required this.admin,
  });

  factory StoreWithAdminModel.fromJson(Map<String, dynamic> json) =>
      _$StoreWithAdminModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreWithAdminModelToJson(this);
}

@JsonSerializable()
class Admin {
  final String name;
  final String photo;
  final String username;
  final String password;

  Admin({
    required this.name,
    required this.photo,
    required this.username,
    required this.password,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);

  Map<String, dynamic> toJson() => _$AdminToJson(this);
}
