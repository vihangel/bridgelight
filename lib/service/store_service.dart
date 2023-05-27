import 'package:dio/dio.dart';
import 'package:mybookstore/core/utils/constants.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:mybookstore/domain/entities/store_model.dart';
import 'package:retrofit/retrofit.dart';

part 'store_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class StoreService {
  factory StoreService(
    Dio dio, {
    required String baseUrl,
  }) = _StoreService;

  @GET('v1/store/1')
  Future<StoreModel> getStore(
    @Header('Authorization') String authorization,
  );

  @PUT('v1/store/1')
  Future<void> updateStore(
    @Header('Authorization') String authorization,
    @Body() StoreModel store,
  );

  @POST('v1/store/1/employee')
  Future<EmployeeModel> createEmployee(
    @Header('Authorization') String authorization,
    @Body() EmployeeModel employee,
  );

  @GET('v1/store/1/employee')
  Future<List<EmployeeModel>> getEmployees(
    @Header('Authorization') String authorization,
  );

  @PUT('v1/store/1/employee/{id}')
  Future<void> updateEmployee(
    @Header('Authorization') String authorization,
    @Path('id') int id,
    @Body() EmployeeModel employee,
  );

  @DELETE('v1/store/1/employee/{id}')
  Future<void> deleteEmployee(
    @Header('Authorization') String authorization,
    @Path('id') int id,
  );

  @POST('v1/store/1/book')
  Future<void> createBook(
    @Header('Authorization') String authorization,
    @Body() Map<String, dynamic> book,
  );
}
