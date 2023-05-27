// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      banner: json['banner'] as String?,
      idStore: json['idStore'] as int,
      name: json['name'] as String,
      slogan: json['slogan'] as String,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'idStore': instance.idStore,
      'name': instance.name,
      'slogan': instance.slogan,
    };
