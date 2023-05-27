import 'package:dio/dio.dart';
import 'package:mybookstore/core/utils/constants.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:retrofit/http.dart';

part 'employee_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class EmployeeService {
  factory EmployeeService(
    Dio dio, {
    required String baseUrl,
  }) = _EmployeeService;

  @POST('v1/store/1/employee')
  Future<EmployeeModel> createEmployee(
    @Header('Authorization') String authorization,
    @Body() CreateEmployeeModel employee,
  );

  @GET('v1/store/1/employee')
  Future<List<EmployeeModel>> getEmployees(
    @Header('Authorization') String authorization,
  );

  @PUT('v1/store/1/employee/{id}')
  Future editEmployee(
    @Header('Authorization') String authorization,
    @Path('id') String id,
    @Body() CreateEmployeeModel employee,
  );

  @DELETE('v1/store/1/employee/{id}')
  Future<dynamic> deleteEmployee(
    @Header('Authorization') String authorization,
    @Path('id') String id,
  );
}
