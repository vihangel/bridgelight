import 'package:dio/dio.dart';
import 'package:mybookstore/domain/entities/auth_model.dart';
import 'package:mybookstore/domain/entities/create_store_model.dart';
import 'package:retrofit/retrofit.dart';

import '../core/utils/constants.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("v1/auth")
  Future<dynamic> authenticateUser(@Body() AuthModel request);

  @POST("v1/store")
  Future<dynamic> createStore(@Body() StoreWithAdminModel request);

  ///TODO: Validar token, tarefa com menos urgencia.
  @POST("v1/auth/validateToken")
  Future<dynamic> validateToken(@Body() dynamic token);
}
