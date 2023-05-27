// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      id: json['id'] as int,
      name: json['name'] as String,
      photo: json['photo'] as String?,
      username: json['username'] as String,
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'username': instance.username,
    };

CreateEmployeeModel _$CreateEmployeeModelFromJson(Map<String, dynamic> json) =>
    CreateEmployeeModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      photo: json['photo'] as String?,
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$CreateEmployeeModelToJson(
        CreateEmployeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'username': instance.username,
      'password': instance.password,
    };
