import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/product_model/product_detiles/product_details_model.dart';
import '../../../data/model/product_model/product_model.dart';
import '../../../data/repository/product_user_repo/product_user_repo.dart';

part 'product_user_state.dart';

class ProductUserCubit extends Cubit<ProductUserState> {
  ProductUserCubit() : super(ProductInitial());

  static ProductUserCubit get(context) => BlocProvider.of(context);
  UserProductRepo productRepo = ProductUserRepoImpl();
  ScrollController scrollController = ScrollController();
  int pageScroll = 1;
  ProductDetailsModel? productDetails;

  scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        pageScroll++;
        getProduct();
      }
    });
  }

  ProductModel? productModel;

  getProduct() async {
    if (pageScroll == 1) {
      emit(ProductLoading());
    }
    final response = await productRepo.getProduct(pageScroll);
    response.fold((error) {
      emit(ProductError(error.toString()));
    }, (data) {
      if (pageScroll == 1) {
        productModel = data;
      } else {
        productModel!.data!.addAll(data.data!);
      }
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
      emit(ProductDetailsLoaded());
    });
  }

  Future<void> deleteProduct(int id) async
  {
    emit(ProductDeleteLoading());
    final response = await productRepo.deleteProduct(id);
    response.fold((error) {
      emit(ProductDeleteError(error.toString()));
    }, (data) {
      emit(ProductDeleted());
    });

  }
}
