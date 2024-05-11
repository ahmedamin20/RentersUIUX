import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/repository/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/model/product_model/product_detiles/product_details_model.dart';
import '../../../data/model/product_model/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);
  ProductRepo productRepo = ProductRepoImpl();
  ScrollController scrollController = ScrollController();
  int pageScroll = 1;
  ProductDetailsModel? productDetails;

  scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // pageScroll++;
        getProduct();
      }
    });
  }

  ProductModel? productModel;

  getProduct() async {
    if (pageScroll == 1) {
      emit(ProductLoading());
    }
    final response = await productRepo.getProduct(1);
    response.fold((error) {
      print(error.message);
      emit(ProductError(error.toString()));
    }, (data) {
      productModel = data;
      emit(ProductLoaded());
    });
  }

  Future<void> getProductDetails(int id) async {
    emit(ProductDetailsLoading());
    final response = await productRepo.getProductDetails(id);
    response.fold((error) {
      emit(ProductDetailsError(error.toString()));
    }, (data) {
      productDetails = data;
      print(productDetails!.toJson());
      emit(ProductDetailsLoaded());
    });
  }
}
