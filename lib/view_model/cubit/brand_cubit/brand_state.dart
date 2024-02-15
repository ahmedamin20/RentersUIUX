part of 'brand_cubit.dart';

@immutable
abstract class BrandState {}

class BrandInitial extends BrandState {}
class BrandLoadingMore extends BrandState {}
class BrandLoading extends BrandState {}
class BrandSuccess extends BrandState {
  final BrandModel brandModel;
  BrandSuccess(this.brandModel);
}
class BrandError extends BrandState {
  final String error;
  BrandError(this.error);
}
class BrandProductSuccess extends BrandState {
  final GetProductModel getProductModel;
  BrandProductSuccess(this.getProductModel);
}
class BrandProductError extends BrandState {
  final String error;
  BrandProductError(this.error);
}
class BrandProductLoading extends BrandState {}
