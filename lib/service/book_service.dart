import 'package:dio/dio.dart';
import 'package:mybookstore/core/utils/constants.dart';
import 'package:mybookstore/domain/entities/book_model.dart';
import 'package:mybookstore/domain/entities/create_book_model.dart';
import 'package:retrofit/retrofit.dart';

part 'book_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class BooksService {
  factory BooksService(
    Dio dio, {
    required String baseUrl,
  }) = _BooksService;

  @GET('v1/store/1/book')
  Future<List<BookModel>> getBooks(
    @Header('Authorization') String authorization,
  );

  @PUT('v1/store/1/book/{id}')
  Future editBook(
    @Header('Authorization') String authorization,
    @Path('id') String id,
    @Body() CreateBookModel book,
  );

  @POST('v1/store/1/book')
  Future<BookModel> createBook(
    @Header('Authorization') String authorization,
    @Body() CreateBookModel book,
  );

  @DELETE('v1/store/1/book/{id}')
  Future<dynamic> deleteBook(
    @Header('Authorization') String authorization,
    @Path('id') String id,
  );

  @GET('v1/store/1/book')
  Future<List<BookModel>> searchBook(
    @Header('Authorization') String authorization, {
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('author') String? author,
    @Query('title') String? title,
    @Query('year-start') int? yearStart,
    @Query('year-finish') int? yearFinish,
    @Query('rating') int? rating,
    @Query('available') bool? available,
  });
}
