import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class Store {
  final String banner;
  final int id;
  final String name;
  final String slogan;

  Store(
      {required this.banner,
      required this.id,
      required this.name,
      required this.slogan});

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String photo;
  final String role;

  User(
      {required this.id,
      required this.name,
      required this.photo,
      required this.role});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class AuthResponse extends Equatable {
  final String refreshToken;
  final Store store;
  final String token;
  final User user;

  const AuthResponse(
      {required this.refreshToken,
      required this.store,
      required this.token,
      required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  @override
  List<Object?> get props => [refreshToken, store, token, user];
}
