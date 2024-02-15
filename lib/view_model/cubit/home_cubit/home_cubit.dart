import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/show_all_branch/show_all_branch_model.dart';
import 'package:ksb/data/model/show_one_product_model/show_one_product_model.dart';
import 'package:meta/meta.dart';

import '../../../data/model/addon.dart';
import '../../../data/model/branch/branch_model.dart';
import '../../../data/model/show_all_branch_product/show_all_branch_product.dart';
import '../../../data/repository/home_repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());


  static HomeCubit get(context) => BlocProvider.of(context);

  HomeRepo homeRepo;
  ScrollController scrollController =ScrollController();
  ScrollController scrollController2 =ScrollController();
  int pageScroll = 1;
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  int? lastPage;
  num ?selectValue;
  String ?selectValue2;

  num sizeItem=0;
  num priceOfItem=0;
  List<num> priceAddOneList=[];

  Map<int,String> sizeMap={};
  void scroll() {
    print("Scrolling started");

    scrollController.addListener(() {
      if (_isScrollControllerValid()) {
        _handleScroll();
      }
    });
  }
  bool _isScrollControllerValid() {
    return scrollController.position.pixels ==
        scrollController.position.maxScrollExtent;
  }

  void _handleScroll() {
    print("Handling scroll");
    pageScroll++;

    if (_hasMorePages()) {
      print("Loading page $pageScroll");

      getAllBranch(page: pageScroll);

    } else {
      print("No more pages to load");
    }
  }
  bool _hasMorePages() {
    return pageScroll <= lastPage!;
  }

  String? branchId;


  ShowAllBranchModel?  showAllBranchModel;


  Future getAllBranch({required int page,storeId}) async {
    emit(HomeLoading());
    var data = await homeRepo.showAllBranch(page: page,storeId: storeId);

    data.fold((l) {
      print(' ${l.message}');
      emit(HomeError(l.toString()));

    }, (r) {
      if (pageScroll == 1) {


        showAllBranchModel = r;
        lastPage = r.meta!.lastPage;

      } else {
        showAllBranchModel!.data!.addAll(r.data!);
        lastPage = r.meta!.lastPage;

      }

      emit(HomeSuccess());
    });
  }




  ShowAllBranchProducts? showAllBranchProducts;

  Future showAllBranchProduct({required String  id,required page,menuSelectionId}) async {
    emit(BranchLoading());
    final response = await homeRepo.showAllBranchProduct(id: id, page: page,menuSelectionId: menuSelectionId);
    response.fold((l) {
      print(l.message);
      emit(BranchError(l.toString()));
    }, (r)
    {
      showAllBranchProducts =r;

      emit(BranchSuccess());
    }
    );
  }



  ShowAllMenuSectionsModel? showAllMenuSectionsModel;
  Future showAllMenuSections( {required String  id}   ) async {
    emit(BranchAllProductLoading());


    final response = await homeRepo.showAllMenuSections( idStor: id);
    response.fold((l)
    {
      print('showAllMenuSections ${l.message}');

      emit(BranchAllProductError(l.toString()));
    }, (r) {

      showAllMenuSectionsModel = r ;
      emit(BranchAllProductSuccess());
    });
  }


  ShowOneProductModel? showOneProductModel;
  Future showOneBranchProduct( {required branchId,required productId}) async {
    emit(BranchOneProductLoading());

    final response = await homeRepo.showOneBranchProduct(branchId:branchId!,productId:productId);
    response.fold((l)
    {
      print('Errorrrrrr ${l.message}');
      emit(BranchOneProductError(l.toString()));
    }, (r) {

      showOneProductModel = r ;
      emit(BranchOneProductSuccess());
    });
  }



  int currentIndex=0;
  void changeMenuSectionColor({required index}){

    currentIndex=index;
    emit(ChangeMenuSectionColor());

  }


  int currentIndex2=0;
  void changeBranchColor({required index}){

    currentIndex2=index;
    emit(ChangeBranchColor());

  }
  num totalPriceAddOne=0;
  num totalPrice=0;

  int countOfProduct = 1;
  void changeCountProduct({required operator})
  {
    if(operator=='+')
    {
      countOfProduct++;
    }
    else
    {
      if(countOfProduct>=2){
        countOfProduct--;
      }
    }
    calculatePrice();
    emit(ChangeCountOfProduct());
  }

  void calculatePrice()
  {
    totalPriceAddOne=0;

    for (int i=0; i<priceAddOneList.length ;i++ ) {
      totalPriceAddOne=priceAddOneList[i]+totalPriceAddOne;
    }
// <<<<<<< HEAD
//     totalPrice=sizeItem+totalPriceAddOne+priceOfItem;
// =======
    totalPrice=(sizeItem!+totalPriceAddOne+priceOfItem)*countOfProduct;

    print(totalPrice);
    emit(CalculatePrice());

  }
  void backToDefault()
  {
    priceAddOneList=[];
    sizeItem=0;
    totalPriceAddOne=0;
    selectValue=-1;
    countOfProduct=1;
    totalPrice=0;
    priceOfItem=0;
    emit(BackToDefault());
  }


  // Map<String,dynamic >  size={};
  List<Addons> addons=[];
  String? size;
  Future addToCart({
    required String  branch_product_id,
    required String  DO_NOT_SEND,

  })async
  {
    emit(AddToCartLoading());
    final data =await homeRepo.sentToCart(
        branch_product_id: branch_product_id,
        quantity: countOfProduct,
        addons: addons,
        size: size!,
        DO_NOT_SEND: DO_NOT_SEND);
    data.fold((l)
    {
      emit(AddToCartError(l.toString()));
    }, (r)
    {
      emit(AddToCartSuccess(r.message!));

    });
  }

}