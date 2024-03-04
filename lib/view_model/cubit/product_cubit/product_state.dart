part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
}
class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
class ProductDetailsLoading extends ProductState {}
class ProductDetailsLoaded extends ProductState {
}
class ProductDetailsError extends ProductState {
  final String error;
  ProductDetailsError(this.error);
}