// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ksb/core/resource/assets_manager.dart';
// import 'package:ksb/core/resource/colors_manager.dart';
// import 'package:ksb/notification_module/presentation/manager/notification_cubit/notification_cubit.dart';
// import 'package:ksb/view_model/cubit/information_cubit/information_cubit.dart';
// import 'package:ksb/view_model/cubit/product_cubit/recommended_item_details_cubit.dart';
// import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
// import '../../../../core/resource/text_style_manager.dart';
// import '../../../../core/services/app_router.dart';
// import '../../../../view_model/cubit/layout_cubit/layout_cubit.dart';
//
// class HomeLayout extends StatelessWidget {
//   const HomeLayout({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//   value: NotificationCubit.get(context)..subscribe()..
//   bindNotification(),
//   child: BlocListener<InformationCubit, InformationState>(
//   listener: (context, state) {
//     // TODO: implement listener
//   },
//   child: BlocListener<NotificationCubit, NotificationState>(
//       listener: (context, state)
//       {
//         // TODO: implement listener
//       },
//       child: BlocConsumer<LayoutCubit, LayoutState>
//         (
//         listener: (context, state) {
//           // TODO: implement listener
//         },
//         builder: (context, state) {
//           LayoutCubit cubit = LayoutCubit.get(context);
//           return AnnotatedRegion<SystemUiOverlayStyle>(
//             value: const SystemUiOverlayStyle(
//               //this color must be equal to the WaterDropNavBar backgroundColor
//               systemNavigationBarColor: Colors.white,
//               systemNavigationBarIconBrightness: Brightness.dark,
//             ),
//             child: Scaffold(
//               appBar: cubit.currentIndex == 3 ?
//               PreferredSize(
//                   preferredSize: Size.fromHeight(0.h)
//                 , child: const SizedBox()): PreferredSize(
//                 preferredSize: Size.fromHeight(80.h),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: LayoutCubit.get(context).isDark ? ColorsManager.grayDark:ColorsManager.primaryColor ,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40.r),
//                       bottomRight: Radius.circular(40.r),
//                     ),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(40.r),
//                       bottomRight: Radius.circular(40.r),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         top: 10.h,
//                         left: 20.w,
//                         right: 20.w,
//                       ),
//                       child: AppBar(
//                         backgroundColor: LayoutCubit.get(context).isDark ?
//                         ColorsManager.grayDark:
//                         ColorsManager.primaryColor ,
//
//                         elevation: 0,
//                         title: Text(
//                            cubit.titles[cubit.currentIndex].tr(),
//                           style: TextStyleManager.textStyle16w700.copyWith(color: Colors.white),
//                         ),
//                         centerTitle: true,
//                         actions:
//                         [
//                           (cubit.currentIndex == 0)?IconButton(onPressed: ()
//                          async
//                          {
//
//                             try{
//                               String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//                                   "#ff6666",
//                                   "cancel",
//                                   true,
//                                   ScanMode.BARCODE);
//                               if(barcodeScanRes == "-1")
//                                 {
//                                   return;
//                                 }else
//                                 {
//                                 ProductCubit.get(context).getProductDetialsByBarCode(barcodeScanRes);
//                               }
//
//                             }catch (e)
//                             {
//                               debugPrint(e.toString());
//                             }
//
//                             // context.push(AppRouter.qrScreen);
//                           }, icon: const Icon(Icons.qr_code , color: Colors.white,)) : const SizedBox.shrink()
// ,
//                           (cubit.currentIndex == 0)?
//                           BlocConsumer<NotificationCubit, NotificationState>(
//                             listener: (context, state) {
//                               // TODO: implement listener
//                             },
//                             builder: (context, state) {
//                               NotificationCubit cubit = NotificationCubit.get(context);
//                               return IconButton(
//                                 icon: Stack(
//                                   children: [
//                                     const Image(image: AssetImage(AssetsManager.NOTIFICATION_ICON ,
//                                     ),
//                                     color: Colors.white,
//
//                                     ),
//                                     cubit.count == 0? const
//                                     SizedBox.shrink():  CircleAvatar(
//                                         radius: 8,
//                                         backgroundColor: Colors.red,
//                                         child: Text(
//                                           cubit.count.toString(),
//                                           style: TextStyleManager.textStyle12w500,
//                                         )),
//                                   ],
//                                 ),
//                                 onPressed: () {
//                                   context.push(AppRouter.notificationScreen);
//                                 },
//                               );
//                             },
//                           ) :
//                           const SizedBox.shrink(),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//                 body: PageView(
//                   physics: const NeverScrollableScrollPhysics(),
//                   controller: cubit.pageController,
//                   children: cubit.bottomScreens,
//                 ) ,
//             bottomNavigationBar:  WaterDropNavBar(
//               iconSize: 30,
//               backgroundColor:  LayoutCubit.get(context).isDark? ColorsManager.grayDark : ColorsManager.primaryColor,
//               inactiveIconColor: Colors.white,
//               onItemSelected: (index) {
//                cubit.changeBottomNavBar(index);
//                 cubit.pageController.animateToPage(cubit.currentIndex,
//                     duration: const Duration(milliseconds: 400),
//                     curve: Curves.easeOutQuad);
//               },
//               selectedIndex: cubit.currentIndex,
//               waterDropColor: ColorsManager.white,
//               bottomPadding: 15,
//               barItems: [
//                 BarItem(
//                   filledIcon: Icons.home,
//                   outlinedIcon: Icons.home_outlined,
//                 ),
//                 BarItem(
//                     filledIcon: FontAwesomeIcons.car,
//                     outlinedIcon: Icons.car_rental),
//                 BarItem(
//                     filledIcon: Icons.favorite_rounded,
//                     outlinedIcon: Icons.favorite_border_rounded),
//                 BarItem(
//                     filledIcon: FontAwesomeIcons.solidUser,
//                     outlinedIcon: FontAwesomeIcons.user),
//               ],
//             ),
//             ),
//           );
//
//               // bottomNavigationBar: BottomNavigationBar(
//               //   currentIndex: cubit.currentIndex,
//               //   unselectedItemColor: Colors.grey,
//               //   selectedIconTheme: const IconThemeData(color: Colors.blue),
//               //   onTap: (index)
//               //   {
//               //     cubit.changeBottomNavBar(index);
//               //   },
//               //   items: const [
//               //     BottomNavigationBarItem(
//               //         icon: Icon(Icons.home),
//               //         label: 'Home'),
//               //     BottomNavigationBarItem(
//               //         icon: Icon(Icons.car_rental),
//               //         label: 'Profile'),
//               //     BottomNavigationBarItem(
//               //         icon: Icon(Icons.favorite_border_outlined),
//               //         label: TextManager.favorites),
//               //
//               //     BottomNavigationBarItem(
//               //         icon: Icon(Icons.person), label: 'Profile'),
//               //   ],
//               // ));
//         },
//       ),
//     ),
// ),
// );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../core/services/app_router.dart';
import '../../../../view_model/cubit/layout_cubit/layout_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      buildWhen: (previous, current)
      {
        if(current is LayoutChangeBottomNavBar)
          {
            return true;
          }else
        {
          return false;
        }
      },
      listener: (context, state) {},
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        return Scaffold(
          body: cubit.bottomScreens[cubit.currentIndex],
          floatingActionButtonLocation:  FloatingActionButtonLocation.centerDocked,
          floatingActionButton:  FloatingActionButton(
            onPressed: () {
              context.go(AppRouter.chatScreen);
            },
            child: const Icon(Icons.chat),
            backgroundColor: ColorsManager.primaryColor,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {

                print('-----------');
                LayoutCubit.get(context).changeBottomNavBar(index);
            },
            type: BottomNavigationBarType.fixed,
            elevation: 8,
            selectedItemColor: ColorsManager.primaryColor,
            unselectedItemColor: ColorsManager.gray2,
            currentIndex: cubit.currentIndex,backgroundColor: ColorsManager.white,
            //fixedColor: ColorManager.colorWhite,
            unselectedLabelStyle:
            TextStyleManager.textStyle16w500.copyWith(fontSize: 12, color: ColorsManager.gray2),
            selectedLabelStyle:
            TextStyleManager.textStyle16w500.copyWith(color: ColorsManager.primaryColor, fontSize: 12),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsManager.home,
                  color:
                  cubit.currentIndex == 0 ? ColorsManager.primaryColor : ColorsManager.gray2,
                ),
                label: TextManager.home,
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetsManager.orders,
                      color: cubit.currentIndex == 1
                          ? ColorsManager.primaryColor
                          : ColorsManager.gray2),
                  label: TextManager.orders),
              // BottomNavigationBarItem(
              //     icon: SvgPicture.asset(AssetsManager.cart,
              //         color: cubit.currentIndex == 2
              //             ? ColorsManager.primaryColor
              //             : ColorsManager.gray2),
              //     label: TextManager.cart),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetsManager.search,
                      color: cubit.currentIndex == 2
                          ? ColorsManager.primaryColor
                          : ColorsManager.gray2),
                  label: TextManager.search),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetsManager.profile,
                      color: cubit.currentIndex == 3
                          ? ColorsManager.primaryColor
                          : ColorsManager.gray2),
                  label: TextManager.profile),

            ],
          ),
        );
      },
    );
  }
}
