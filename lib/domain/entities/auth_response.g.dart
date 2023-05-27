// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      banner: json['banner'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      slogan: json['slogan'] as String,
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'banner': instance.banner,
      'id': instance.id,
      'name': instance.name,
      'slogan': instance.slogan,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'role': instance.role,
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      refreshToken: json['refreshToken'] as String,
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'store': instance.store,
      'token': instance.token,
      'user': instance.user,
    };
