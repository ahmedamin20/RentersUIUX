part of 'product_user_cubit.dart';

@immutable
abstract class ProductUserState {}

class ProductInitial extends ProductUserState {}

class ProductLoading extends ProductUserState {}

class ProductLoaded extends ProductUserState {}

class ProductError extends ProductUserState {
  final String error;
  ProductError(this.error);
}

class ProductDetailsLoading extends ProductUserState {}

class ProductDetailsLoaded extends ProductUserState {}

class ProductDetailsError extends ProductUserState {
  final String error;
  ProductDetailsError(this.error);
}


class ProductDeleted extends ProductUserState {}
class ProductDeleteError extends ProductUserState {
  final String error;
  ProductDeleteError(this.error);
}

class ProductDeleteLoading extends ProductUserState {}