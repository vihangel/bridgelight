part of 'employee_bloc.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeeListEvent extends EmployeeEvent {}

class DeleteEmployeeEvent extends EmployeeEvent {
  final String id;

  DeleteEmployeeEvent(this.id);

  @override
  List<Object> get props => [id];
}

class EditEmployeeEvent extends EmployeeEvent {
  final CreateEmployeeModel employee;

  EditEmployeeEvent(this.employee);

  @override
  List<Object> get props => [employee];
}

class CreateEmployeeEvent extends EmployeeEvent {
  final CreateEmployeeModel employee;

  CreateEmployeeEvent(this.employee);

  @override
  List<Object> get props => [employee];
}
