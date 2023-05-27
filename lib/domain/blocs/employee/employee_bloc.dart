import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybookstore/core/utils/usecase.dart';
import 'package:mybookstore/domain/entities/employee_model.dart';
import 'package:mybookstore/domain/usecases/employee/create_book.dart';
import 'package:mybookstore/domain/usecases/employee/delete_book.dart';
import 'package:mybookstore/domain/usecases/employee/edit_book.dart';
import 'package:mybookstore/domain/usecases/employee/get_books.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployee _getList;
  final DeleteEmployee _deleteEmployee;
  final EditEmployee _editEmployee;
  final CreateEmployee _createEmployee;

  EmployeeBloc(this._getList, this._deleteEmployee, this._editEmployee,
      this._createEmployee)
      : super(EmployeeInitialState()) {
    on<GetEmployeeListEvent>((_handleGetListEvent));
    on<DeleteEmployeeEvent>((_handleDeleteEvent));
    on<EditEmployeeEvent>((_handleEditEvent));
    on<CreateEmployeeEvent>((_handleCreateEvent));
  }

  Future<void> _handleGetListEvent(
    GetEmployeeListEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoadingState());

    final result = await _getList(NoParams());

    emit(result.fold(
      (error) => EmployeeErrorState(message: error.message),
      (employee) {
        return EmployeeLoadedState(employee);
      },
    ));
  }

  Future<void> _handleDeleteEvent(
    DeleteEmployeeEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoadingState());

    final result = await _deleteEmployee(event.id);

    emit(result.fold(
      (error) => EmployeeErrorState(message: error.message),
      (employee) {
        return EmployeeSucessState();
      },
    ));
  }

  Future<void> _handleEditEvent(
    EditEmployeeEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoadingState());

    final result = await _editEmployee(event.employee);

    emit(result.fold(
      (error) => EmployeeErrorState(message: error.message),
      (employee) {
        return EmployeeSucessState();
      },
    ));
  }

  Future<void> _handleCreateEvent(
    CreateEmployeeEvent event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoadingState());

    final result = await _createEmployee(event.employee);

    emit(result.fold(
      (error) => EmployeeErrorState(message: error.message),
      (employee) {
        return EmployeeSucessState();
      },
    ));
  }
}
