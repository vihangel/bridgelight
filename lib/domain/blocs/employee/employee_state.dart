part of 'employee_bloc.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitialState extends EmployeeState {}

class EmployeeLoadingState extends EmployeeState {}

class EmployeeLoadedState extends EmployeeState {
  final List<EmployeeModel> employee;

  const EmployeeLoadedState(this.employee);

  @override
  List<Object> get props => [employee];
}

class EmployeeSucessState extends EmployeeState {}

class EmployeeErrorState extends EmployeeState {
  final String message;

  const EmployeeErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
