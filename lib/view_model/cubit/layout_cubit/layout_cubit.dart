import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/views/pages/grage_car/grage_car.dart';
import 'package:ksb/views/pages/home/widgets/home/home_view_body.dart';
import 'package:ksb/views/pages/reem_screens/cart_screen/cart_screen.dart';
import 'package:meta/meta.dart';

import '../../../core/helpers/cach_helpers/cach_helpers.dart';
import '../../../core/resource/text_manager.dart';
import '../../../data/model/get_info_data_model/get_info_data_model.dart';
import '../../../views/home/page/home_screen.dart';
import '../../../views/pages/car_list/cars_view.dart';
import '../../../views/pages/car_list/widgets/car_view_body.dart';
import '../../../views/pages/history_user/pages/visitor_history_screen.dart';
import '../../../views/pages/home/widgets/favorites/favorites_view_body.dart';
import '../../../views/pages/profile/page/profile_screen.dart';
import '../../../views/pages/reem_screens/cart_screen/component/cart_listview_item.dart';
import '../../../views/pages/reem_screens/search_screens/my_order_screen/my_order_screen_layout.dart';
import '../../../views/pages/reem_screens/search_screens/search_screen.dart';
import '../../../views/pages/visitor_car/visitor_car.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  PageController pageController = PageController();
  List<String> titles = [
    TextManager.productAvailable,
    'Visitor Car',
    'Favorites',
  ];
  List<Widget> bottomScreens =
  [
    const HomeScreen(),
    const MyOrderScreenLayOut(),
    // const VisitorCar(),
    // const CarsView(),
    const ListViewCartItem()  ,  //const VisitorCar(),
    // const GrageCar(),
    SearchScreen(),
    const ProfileScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavBar());
  }

  bool isDark = false;

  void changeDarkMood({fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    }
    else {
      isDark = !isDark;
      CacheHelper.put(key: 'isDark', value: isDark);
      emit(ChangeMood());
    }
  }

  Color color = Colors.grey;
  void colornev (int index)
  {
    if (index == currentIndex)
      {
        color = ColorsManager.primaryColor;
      }
    else
      {
        color= Colors.grey;
      }
  }

}
