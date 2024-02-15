part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}



class GetAllCartItemLoading extends CartState {}
class GetAllCartItemSuccess extends CartState {}
class GetAllCartItemError extends CartState {
  final String message;
  GetAllCartItemError(this.message);
}
