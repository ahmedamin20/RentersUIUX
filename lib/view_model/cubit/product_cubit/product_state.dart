part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class GetProductLoading extends ProductState {}
class GetProductSuccess extends ProductState
{

  GetProductSuccess();
}
class GetProductError extends ProductState
{
  final Failure failure;

  GetProductError(this.failure);
}

class ProductDetilesLoading extends ProductState {}
class ProductDetilesSuccess extends ProductState
{
  GetProductDetilesModel getProductDetilesModel;
  ProductDetilesSuccess(this.getProductDetilesModel);
}
class ProductDetilesError extends ProductState
{
  final Failure failure;

  ProductDetilesError(this.failure);
}