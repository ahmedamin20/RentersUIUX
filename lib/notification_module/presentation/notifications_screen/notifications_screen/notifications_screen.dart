import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/data/repository/car_fixes_repo/car_fixes_repo.dart';
import 'package:ksb/views/componants/custom_app_bar/custom_app_bar.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_empty_data/custom_empty_data.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../core/services/service_locator/service_locator.dart';
import '../../../../view_model/cubit/car_fixes_cubit/car_fixes_cubit.dart';
import '../../../../view_model/cubit/layout_cubit/layout_cubit.dart';
import '../../manager/notification_cubit/notification_cubit.dart';
import '../notifications_widget/notifications_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});


  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
{
  final ScrollController _scrollController = ScrollController();

  @override
  void initState()
  {
    NotificationCubit.get(context).getNotification();
    // TODO: implement initState
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (NotificationCubit.get(context).page <=
            NotificationCubit.get(context).notificationModel!.meta!.lastPage!) {
          NotificationCubit.get(context).getNotification();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
  value: NotificationCubit.get(context)..getNotification(reset: true)..getNotificationCount(),
  child: BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state)
      {
        if(state is NotificationActionLoading)
          {
            customEasyLoading();
          }
        else if(state is  NotificationOneDeleteSuccessState)
            {
              NotificationCubit.get(context).getNotification(reset: true);
              if(NotificationCubit.get(context).count!=0)
                {
                  NotificationCubit.get(context).count--;
                }
              NotificationCubit.get(context).emit(GetNotificationCountSuccessState(NotificationCubit.get(context).count));
              NotificationCubit.get(context).emit(NotificationSuccessState(NotificationCubit.get(context).notificationModel!));
              EasyLoading.dismiss();
            }  else if(state is NotificationAllDeleteSuccessState)
              {
                NotificationCubit.get(context).notificationModel!.data!.clear();
                NotificationCubit.get(context).count = 0;
                NotificationCubit.get(context).emit(GetNotificationCountSuccessState(NotificationCubit.get(context).count));
                NotificationCubit.get(context).emit(NotificationSuccessState(NotificationCubit.get(context).notificationModel!));
                EasyLoading.dismiss();

              }else if(state is NotificationAllSeenSuccessState)
                {
                  for (var element in NotificationCubit.get(context).notificationModel!.data!) {
                    element.seen = true;
                  }
                  NotificationCubit.get(context).count = 0;
                  NotificationCubit.get(context).emit(GetNotificationCountSuccessState(NotificationCubit.get(context).count));
                  NotificationCubit.get(context).emit(NotificationSuccessState(NotificationCubit.get(context).notificationModel!));
                  EasyLoading.dismiss();

                }else if(state is NotificationSeenOneSuccessState)
                  {
                    NotificationCubit.get(context).notificationModel!.data![state.index].seen = true;
                    NotificationCubit.get(context).count--;
                    NotificationCubit.get(context).emit(GetNotificationCountSuccessState(NotificationCubit.get(context).count));
                    NotificationCubit.get(context).emit(NotificationSuccessState(NotificationCubit.get(context).notificationModel!));
                    EasyLoading.dismiss();

                  }else if(state is NotificationActionError)
                    {
                      EasyLoading.dismiss();

                      customSnackBar(message: state.error, snackBarType: SnackBarType.error, context: context);
                    }else if(state is NotificationOneDeleteSuccessState)
                    {

                    }
        else{
          EasyLoading.dismiss();

        }
      },
      builder: (context, state) {
        NotificationCubit cubit = NotificationCubit.get(context);

        return Scaffold(
          appBar: AppBarCustom(
            title: "Notifications".tr(),
          ),

          // backgroundColor: ColorManager.colorScaffold,
          body: SafeArea(
            child: Column(
              children: [

                // AppBarWidget(
                //   text: TextManager.NOTIFICATIONS.tr,
                //   height: 124,
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                   [
                    GestureDetector(
                      onTap: ()
                      {
                        NotificationCubit.get(context).seenAllNotification();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: LayoutCubit.get(context).isDark ? ColorsManager.grayDark:ColorsManager.primaryColor ,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Make All Read".tr(),
                            style: TextStyleManager.textStyle16w700.copyWith(color: ColorsManager.white),
                          ),
                        ),
                      ),
                    ),
                    // delete all notification
                    IconButton(onPressed: ()
                      {
                        NotificationCubit.get(context).deleteAllNotification();

                      }, icon: const Icon(Icons.delete_forever , color: ColorsManager.primaryColor) ,
                    iconSize: 40.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                (state is NotificationLoadingState)
                    ? const ShimmerNotificationLoading()
                    : (NotificationCubit.get(context).notificationModel != null)
                        ? (NotificationCubit.get(context).notificationModel!.data!.isEmpty)?
                    const CustomEmptyData()
                    : Expanded(
                            // width: ScreenUtil().screenWidth,
                            // height: 700.h,
                            child: AnimationLimiter(
                              child: ListView.separated(
                                  controller: _scrollController,
                                  itemBuilder: (context, index) =>
                                      AnimationConfiguration.staggeredList(
                                          position: index,
                                          duration: const Duration(milliseconds: 500),
                                        child: SlideAnimation(
                                          child: FadeInAnimation(
                                            child: GestureDetector(
                                              onTap: ()
                                              {
                                                NotificationCubit.get(context).
                                                seenOneNotification(NotificationCubit.get(context).notificationModel!.data![index].id!, index);
                                                context.push(
                                                  AppRouter.cardetails,
                                                    extra: {
                                                      'id': NotificationCubit.get(context).notificationModel!.data![index].body!.modelId,
                                                      "cubit" :CarFixesCubit(sl<CarFixesRepoImpl>()) ,
                                                      "carName" : "Fix Car"
                                                    }
                                                );
                                              },
                                              onLongPress: ()
                                              {
                                                showDialog(context: context, builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text("Delete Notification  ?"),
                                                    content: const Text("Are you sure you want to delete this notification ?" ),
                                                    actions: [
                                                      TextButton(onPressed: ()
                                                      {
                                                      NotificationCubit.get(context).
                                                      deleteOneNotification(NotificationCubit.get(context).notificationModel!.data![index].id!
                                                          , index);
                                                        Navigator.pop(context);
                                                      }, child: const Text("Yes")),
                                                      TextButton(onPressed: ()
                                                      {
                                                        Navigator.pop(context);
                                                      }, child: const Text("No")),

                                                    ],
                                                  );
                                                },);
                                              },
                                              child: NotificationsCard(
                                                index: index,
                                                notificationModelData:
                                                    NotificationCubit.get(context)
                                                        .notificationModel!
                                                        .data![index],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) => SizedBox(
                                        height: 10.h,
                                      ),
                                  itemCount: NotificationCubit.get(context)
                                      .notificationModel!
                                      .data!
                                      .length),
                            ))
                        : (state is NotificationErrorState)
                            ? Center(
                                child: Text(state.error),
                              )
                            : Container()
              ],
            ),
          ),
        );
      },
    ),
);
  }
}

class ShimmerNotificationLoading extends StatelessWidget {
  const ShimmerNotificationLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        // width: ScreenUtil().screenWidth,
        // height: 700.h,
        child: ListView.separated(
            itemBuilder: (context, index) => Shimmer.fromColors(
                  baseColor: ColorsManager.white,
                  highlightColor: ColorsManager.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 260.w,
                              height: 100.h,
                              color: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
            itemCount: 10));
  }
}
