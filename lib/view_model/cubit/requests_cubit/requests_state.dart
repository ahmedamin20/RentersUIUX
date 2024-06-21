part of 'requests_cubit.dart';

sealed class RequestsState extends Equatable {
  const RequestsState();

  @override
  List<Object> get props => [];
}

final class RequestsInitial extends RequestsState {}

final class   RequestsLoading extends RequestsState {}

final class RequestsSuccess extends RequestsState {
  final ShowOrderModel showOrderModel;

  const RequestsSuccess(this.showOrderModel);

  @override
  List<Object> get props => [showOrderModel];
}

final class RequestsError extends RequestsState {
  final String message;

  const RequestsError(this.message);

  @override
  List<Object> get props => [message];
}

final class RequestsAcceptSuccess extends RequestsState {

  const RequestsAcceptSuccess();

  @override
  List<Object> get props => [];
}

final class RequestsAcceptError extends RequestsState {
  final String message;

  const RequestsAcceptError(this.message);

  @override
  List<Object> get props => [message];
} 
final class RequestsOrderLoading extends RequestsState {}


final class CancelOrderLoading extends RequestsState {}

final class CancelOrderSuccess extends RequestsState {}

final class CancelOrderError extends RequestsState {
  final String message;

  const CancelOrderError(this.message);

  @override
  List<Object> get props => [message];
} 

final class MakeOrderRequestLoading extends RequestsState {}

final class MakeOrderRequestSuccess extends RequestsState {}

final class MakeOrderRequestError extends RequestsState {
  final String message;

  const MakeOrderRequestError(this.message);

  @override
  List<Object> get props => [message];
}