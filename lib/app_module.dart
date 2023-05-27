import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mybookstore/auth/data/datasources/auth_local_datasouce.dart';
import 'package:mybookstore/core/utils/constants.dart';
import 'package:mybookstore/domain/blocs/book/create_book/create_book_bloc.dart';
import 'package:mybookstore/domain/blocs/book/details_book/details_bloc.dart';
import 'package:mybookstore/domain/blocs/employee/employee_bloc.dart';
import 'package:mybookstore/domain/blocs/home/home_bloc.dart';
import 'package:mybookstore/domain/blocs/login/auth_bloc.dart';
import 'package:mybookstore/domain/repositories/auth_repository.dart';
import 'package:mybookstore/domain/repositories/book_repository.dart';
import 'package:mybookstore/domain/usecases/book/create_book.dart';
import 'package:mybookstore/domain/usecases/book/delete_book.dart';
import 'package:mybookstore/domain/usecases/book/edit_book.dart';
import 'package:mybookstore/domain/usecases/book/get_books.dart';
import 'package:mybookstore/domain/usecases/employee/create_book.dart';
import 'package:mybookstore/domain/usecases/employee/delete_book.dart';
import 'package:mybookstore/domain/usecases/employee/edit_book.dart';
import 'package:mybookstore/domain/usecases/employee/get_books.dart';
import 'package:mybookstore/domain/usecases/login/auth_create_store.dart';
import 'package:mybookstore/domain/usecases/login/authenticate_user.dart';
import 'package:mybookstore/domain/usecases/login/check_for_logged_user.dart';
import 'package:mybookstore/pages/book_details/pages/book_details_page.dart';
import 'package:mybookstore/pages/create_book/pages/create_book.dart';
import 'package:mybookstore/pages/create_employee/pages/create_employee.dart';
import 'package:mybookstore/pages/create_store/pages/create_store_page.dart';
import 'package:mybookstore/pages/home/controller_home_page.dart';
import 'package:mybookstore/pages/login/page/login_page.dart';
import 'package:mybookstore/pages/splash/page/splash_page.dart';
import 'package:mybookstore/service/auth_service.dart';
import 'package:mybookstore/service/book_service.dart';
import 'package:mybookstore/service/employee_service.dart';

import 'domain/repositories/employee_repository.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),

    ///Services
    Bind.lazySingleton((i) => AuthRepositoryImpl(i.get<AuthService>())),
    Bind.lazySingleton((i) => AuthService(i.get<Dio>())),
    Bind.lazySingleton((i) => BookRepositoryImpl(i.get<BooksService>())),
    Bind.lazySingleton((i) => BooksService(i.get<Dio>(), baseUrl: BASE_URL)),
    Bind.lazySingleton((i) => EmployeeRepositoryImpl(i.get<EmployeeService>())),
    Bind.lazySingleton((i) => EmployeeService(i.get<Dio>(), baseUrl: BASE_URL)),

    ///UseCases
    Bind.lazySingleton((i) => AuthenticateUser(i.get<AuthRepositoryImpl>())),
    Bind.lazySingleton(
        (i) => CheckForLoggedInUser(i.get<AuthRepositoryImpl>())),
    Bind.lazySingleton((i) => AuthCreateStore(i.get<AuthRepositoryImpl>())),
    Bind.lazySingleton((i) => GetBooks(i.get<BookRepositoryImpl>())),
    Bind.lazySingleton((i) => DeleteBook(i.get<BookRepositoryImpl>())),
    Bind.lazySingleton((i) => EditBook(i.get<BookRepositoryImpl>())),
    Bind.lazySingleton((i) => CreateBook(i.get<BookRepositoryImpl>())),
    Bind.lazySingleton((i) => GetEmployee(i.get<EmployeeRepositoryImpl>())),
    Bind.lazySingleton((i) => DeleteEmployee(i.get<EmployeeRepositoryImpl>())),
    Bind.lazySingleton((i) => EditEmployee(i.get<EmployeeRepositoryImpl>())),
    Bind.lazySingleton((i) => CreateEmployee(i.get<EmployeeRepositoryImpl>())),

    ///Bloc
    Bind.lazySingleton((i) => AuthBloc(i.get<AuthenticateUser>(),
        i.get<CheckForLoggedInUser>(), i.get<AuthCreateStore>())),
    Bind.lazySingleton((i) => HomeBloc(i.get<GetBooks>())),
    Bind.lazySingleton((i) => DetailsBloc(i.get<DeleteBook>())),
    Bind.lazySingleton(
        (i) => CreateBookBloc(i.get<CreateBook>(), i.get<EditBook>())),
    Bind.lazySingleton((i) => EmployeeBloc(
        i.get<GetEmployee>(),
        i.get<DeleteEmployee>(),
        i.get<EditEmployee>(),
        i.get<CreateEmployee>())),

    Bind.lazySingleton<AuthLocalDataSource>(
        (i) => AppAuthLocalDataSource(hive: i.get<HiveInterface>())),
    Bind((i) => HiveInterface),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => const SplashPage(),
            transition: TransitionType.fadeIn),
        ChildRoute('/login',
            child: (_, args) => LoginPage(), transition: TransitionType.fadeIn),
        ChildRoute('/createstore',
            child: (_, args) => CreateStorePage(),
            transition: TransitionType.fadeIn),
        ChildRoute('/home',
            child: (_, args) => const ControllerHomePage(),
            transition: TransitionType.fadeIn),
        ChildRoute('/details',
            child: (_, args) => BookDetailsPage(book: args.data),
            transition: TransitionType.downToUp),
        ChildRoute('/createbook',
            child: (_, args) => CreateBookPages(
                  book: args.data['book'],
                  edit: args.data['edit'],
                ),
            transition: TransitionType.downToUp),
        ChildRoute('/createemployee',
            child: (_, args) => CreateEmployeePage(
                  employee: args.data['employee'],
                  edit: args.data['edit'],
                ),
            transition: TransitionType.downToUp),
      ];
}
