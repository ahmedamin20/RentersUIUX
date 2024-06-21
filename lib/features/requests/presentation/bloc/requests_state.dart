part of 'requests_bloc.dart';

abstract class RequestsState extends Equatable {
  const RequestsState();  

  @override
  List<Object> get props => [];
}
class RequestsInitial extends RequestsState {}
