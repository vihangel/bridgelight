import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybookstore/domain/blocs/book/create_book/create_book_bloc.dart';
import 'package:mybookstore/domain/blocs/book/details_book/details_bloc.dart';
import 'package:mybookstore/domain/blocs/employee/employee_bloc.dart';
import 'package:mybookstore/domain/blocs/home/home_bloc.dart';
import 'package:mybookstore/domain/blocs/login/auth_bloc.dart';
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
import 'package:mybookstore/pages/create_book/pages/create_book.dart';
import 'package:mybookstore/pages/home/controller_home_page.dart';
import 'package:mybookstore/pages/login/page/login_page.dart';
import 'package:provider/single_child_widget.dart';

mixin BlocInitialize {
  List<SingleChildWidget> blocs = [
    MultiBlocProvider(providers: [
      BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
          Modular.get<AuthenticateUser>(),
          Modular.get<CheckForLoggedInUser>(),
          Modular.get<AuthCreateStore>(),
        ),
      )
    ], child: LoginPage()),
    MultiBlocProvider(providers: [
      BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
          Modular.get<GetBooks>(),
        ),
      )
    ], child: const ControllerHomePage()),
    MultiBlocProvider(providers: [
      BlocProvider<DetailsBloc>(
        create: (context) => DetailsBloc(
          Modular.get<DeleteBook>(),
        ),
      )
    ], child: const ControllerHomePage()),
    MultiBlocProvider(
        providers: [
          BlocProvider<CreateBookBloc>(
            create: (context) => CreateBookBloc(
              Modular.get<CreateBook>(),
              Modular.get<EditBook>(),
            ),
          )
        ],
        child: const CreateBookPages(
          edit: false,
        )),
    MultiBlocProvider(providers: [
      BlocProvider<EmployeeBloc>(
        create: (context) => EmployeeBloc(
          Modular.get<GetEmployee>(),
          Modular.get<DeleteEmployee>(),
          Modular.get<EditEmployee>(),
          Modular.get<CreateEmployee>(),
        ),
      )
    ], child: const ControllerHomePage()),
  ];
}
