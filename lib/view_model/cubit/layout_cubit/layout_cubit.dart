import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/views/pages/chat/presentation/ui/screen/chat_screen.dart';
import 'package:ksb/views/pages/home/widgets/home/home_view_body.dart';
import 'package:ksb/views/pages/my_product/my_product.dart';
import 'package:ksb/views/pages/reem_screens/cart_screen/cart_screen.dart';
import 'package:meta/meta.dart';

import '../../../core/helpers/cach_helpers/cach_helpers.dart';
import '../../../core/resource/text_manager.dart';
import '../../../views/home/page/home_screen.dart';
import '../../../views/pages/profile/page/profile_screen.dart';
import '../../../views/pages/reem_screens/search_screens/my_order_screen/my_order_screen_layout.dart';
import '../../../views/pages/reem_screens/search_screens/search_screen.dart';

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
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const MyOrderScreenLayOut(),
    const MyProduct(),
    const ProfileScreen(),
    const ChatScreen()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavBar());
  }

  bool isDark = false;

  void changeDarkMood({fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.put(key: 'isDark', value: isDark);
      emit(ChangeMood());
    }
  }

  Color color = Colors.grey;
  void colornev(int index) {
    if (index == currentIndex) {
      color = ColorsManager.primaryColor;
    } else {
      color = Colors.grey;
    }
  }
}
