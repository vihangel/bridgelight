import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable()
class EmployeeModel extends Equatable {
  final int id;
  final String name;
  final String? photo;
  final String username;

  const EmployeeModel({
    required this.id,
    required this.name,
    this.photo,
    required this.username,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);

  @override
  List<Object?> get props => [id, name, photo, username];
}

@JsonSerializable()
class CreateEmployeeModel extends Equatable {
  String? id;
  final String name;
  final String? photo;
  final String username;
  final String password;

  CreateEmployeeModel({
    this.id,
    required this.name,
    this.photo,
    required this.username,
    required this.password,
  });

  factory CreateEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$CreateEmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateEmployeeModelToJson(this);

  @override
  List<Object?> get props => [name, photo, username, password];
}
