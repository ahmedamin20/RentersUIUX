part of 'add_product_screen_cubit.dart';

abstract class UpdateProductScreenState {}

class AddProductScreenInitial extends UpdateProductScreenState {}

class AddProductScreenPickImageSuccess extends UpdateProductScreenState {}

class AddProductScreenLoading extends UpdateProductScreenState {}

class AddProductScreenSuccess extends UpdateProductScreenState {}

class AddProductScreenError extends UpdateProductScreenState {
  final String error;
  AddProductScreenError(this.error);
}

class GetProductDetailsLoading extends UpdateProductScreenState {}

class GetProductDetailsSuccess extends UpdateProductScreenState
 {
  final ProductDetailsModel productDetails;
  GetProductDetailsSuccess(this.productDetails);
 }

class GetProductDetailsError extends UpdateProductScreenState {
  final String error;
  GetProductDetailsError(this.error);
}
