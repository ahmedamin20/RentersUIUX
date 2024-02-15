import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../data/model/profile_ui_model/profile_ui_model.dart';
import '../../notes/widget/delete_note_dialog.dart';
import '../components/custom_card_profile/custom_card_profile.dart';

class ProfileItemListView extends StatelessWidget {
  const ProfileItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProfileUiModel> profileItems=[
      // ProfileUiModel(
      //   ColorsManager.blackColor,
      //   description: 'Description text will be here',
      //   title:  TextManager.deliveryAddress.tr(),
      //   iconData: AssetsManager.location2,
      //   onTap: (){
      //     context.push((AppRouter.deliveryAddress));
      //   },
      // ),
      // ProfileUiModel(
      //   ColorsManager.blackColor,
      //   description: 'Description text will be here',
      //   title:  TextManager.paymentMethod.tr(),
      //   iconData: AssetsManager.wallet2,
      //   onTap: ()
      //   {
      //     context.push((AppRouter.payment));
      //   },
      // ),
      // ProfileUiModel(
      //   ColorsManager.blackColor,
      //
      //   title:  TextManager.language.tr(),
      //   description: 'english ',
      //   iconData: AssetsManager.languageProfile,
      //   onTap: ()
      //   {
      //     context.push((AppRouter.language));
      //   },
      // ),
      // ProfileUiModel(
      //   ColorsManager.blackColor,
      //
      //   title:  TextManager.notification.tr(),
      //   iconData: AssetsManager.notification,
      //   onTap: ()
      //   {
      //     context.push((AppRouter.notificationView));
      //   },
      // ),
      // ProfileUiModel(
      //   ColorsManager.blackColor,
      //
      //   title:  TextManager.wallet.tr(),
      //   iconData: AssetsManager.wallet2,
      //   onTap: ()
      //   {
      //     context.push((AppRouter.myWalletView));
      //   },
      // ),
      // ProfileUiModel(
      //   ColorsManager.blackColor,
      //
      //   title:  TextManager.notes.tr(),
      //   iconData: AssetsManager.notes,
      //   onTap: ()
      //   {
      //     context.push((AppRouter.notes));
      //   },
      // ),
      ProfileUiModel(
        ColorsManager.blackColor,

        isArrow: true,
        title:  TextManager.contactUs.tr(),
        iconData: AssetsManager.terms,
        onTap: ()
        {
          context.push((AppRouter.contactUs));

        },
      ),

      ProfileUiModel(
        ColorsManager.blackColor,

        isArrow: false,
        title:  TextManager.terms.tr(),
        iconData: AssetsManager.termsAndCondition,
        onTap: ()
        {
          context.push((AppRouter.termsAndCondationView));

        },
      ),
      ProfileUiModel(
        ColorsManager.blackColor,
        isArrow: false,
        title:  TextManager.aboutApp.tr(),
        iconData: AssetsManager.about,
        onTap: ()
        {
          context.push((AppRouter.aboutApp));
        },
      ),
      ProfileUiModel(
        ColorsManager.blackColor,
        isArrow: false,
        title:  TextManager.supportChat.tr(),
        iconData: AssetsManager.supportChat,
        onTap: ()
        {
          context.push((AppRouter.supportChat));
        },
      ),
      ProfileUiModel(
        Colors.red,
        isArrow: false,
        title:  TextManager.logout.tr(),
        iconData: AssetsManager.logOutIcon,
        onTap: ()
        {
          showDialog(context: context, builder: (context){
            return  Dialog(
              child: DeleteNoteDialogWidget(text: TextManager.areYouSureLogOut,
                onPressedYes: () {
                  ProfileCubit.get(context).logout();

                }

                ,),
            );
          });
          // context.push((AppRouter.loginView));
        },
      ),


    ];
    return   ListView.builder(
        itemCount:profileItems.length ,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder:
            (context,index){
          return CustomCardProfile(
            description:profileItems[index].description,
            title: profileItems[index].title,
            color:profileItems[index].color,
            iconData: profileItems[index].iconData,
            onTap: profileItems[index].onTap,
            isArrow: profileItems[index].isArrow,
          );
        }
    );
  }
}
// onTap: ()
// {
//   showModalBottomSheet(context: context,backgroundColor: LayoutCubit.get(context).isDark?ColorsManager.blackColor:ColorsManager.white, builder: (_)
//   {
//     return Container(
//       height: 400.h,
//       decoration:  BoxDecoration(
//         color: LayoutCubit.get(context).isDark?ColorsManager.grayDark:ColorsManager.white,
//         borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
//       ),
//       child: Column(
//         children:
//         [
//           Lottie.asset(AssetsManager.language , width: 150.w),
//           SizedBox(
//             height: 200.h,
//             width: ScreenUtil().screenWidth,
//             child: ListView(
//               children: List.generate(languageList.length,
//                     (index) =>
//                   Padding(
//                     padding:  const EdgeInsets.all( 8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: context.locale.languageCode == languageList[index].code ? ColorsManager.primaryColor :LayoutCubit.get(context).isDark?ColorsManager.blackColor:ColorsManager.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                        border: Border.all(color: LayoutCubit.get(context).isDark?ColorsManager.grayDark:Colors.grey.shade300)
//                       ),
//                       child: ListTile(
//             onTap: ()
//             {
//               context.setLocale(Locale(languageList[index].code));
//
//               // cubit.changeLanguage(languageList[index].code);
//               context.go(AppRouter.homeLayOut);
//             },
//             title: Text(languageList[index].name , style: TextStyleManager.textStyle16w700.copyWith(color:  context.locale.languageCode == languageList[index].code ? ColorsManager.white :LayoutCubit.get(context).isDark?ColorsManager.white: Colors.black),),
//             leading:Image(image: AssetImage(languageList[index].logo),width: 30.w,height: 30.h,) ,
//     ),
//                     ),
//                   ),
//     ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//   },);
// },
