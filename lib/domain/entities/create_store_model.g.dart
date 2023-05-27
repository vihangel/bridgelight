// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreWithAdminModel _$StoreWithAdminModelFromJson(Map<String, dynamic> json) =>
    StoreWithAdminModel(
      name: json['name'] as String,
      slogan: json['slogan'] as String,
      banner: json['banner'] as String,
      admin: Admin.fromJson(json['admin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreWithAdminModelToJson(
        StoreWithAdminModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slogan': instance.slogan,
      'banner': instance.banner,
      'admin': instance.admin,
    };

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      name: json['name'] as String,
      photo: json['photo'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'name': instance.name,
      'photo': instance.photo,
      'username': instance.username,
      'password': instance.password,
    };
