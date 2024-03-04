import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/data/model/cart_model/cart_model.dart';
import 'package:ksb/data/repository/cart_repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  CartRepo cartRepo;

  static CartCubit get(context) => BlocProvider.of(context);

  int count = 0;
  CartModel? cartModel;

  double total2 =0;

  Future getAllCartItem()async
  {
    emit(GetAllCartItemLoading());
    final data = await cartRepo.getAllCartItem();
    data.fold((l) {
      emit(GetAllCartItemError(l.toString()));
    }, (r) {
      cartModel =r;
      // int total = r.data!.fold ( 0, (sum, element) => sum + int.parse(element.price!));


      for(var i in r.data!)
      {
        total2 = total2 + double.parse(i.price!);
      }

      print('total${total2}');
      emit(GetAllCartItemSuccess());
    });
  }




}
