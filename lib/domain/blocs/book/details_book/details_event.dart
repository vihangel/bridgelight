part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DeleteBookEvent extends DetailsEvent {
  final String id;

  const DeleteBookEvent(this.id);

  @override
  List<Object> get props => [id];
}
