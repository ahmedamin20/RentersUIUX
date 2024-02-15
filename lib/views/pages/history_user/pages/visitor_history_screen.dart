import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/visit_history_cubit/visit_history_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_empty_data/custom_empty_data.dart';
import 'package:ksb/views/componants/custom_error_widget/custom_error_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/services/service_locator/service_locator.dart';
import '../../../../data/repository/visite_history_repo/visit_history_repo.dart';
import '../../../../view_model/cubit/layout_cubit/layout_cubit.dart';
import '../../../componants/custom_app_bar/custom_app_bar.dart';

class VisitorHistoryScreen extends StatelessWidget {
  const VisitorHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color colorIcon =LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.primaryColor;
    Color colorText =LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.blackColor;

    return Scaffold(
      appBar:AppBarCustom(
        title: "Visitor History".tr(),
      ),

      body: BlocProvider.value(
  value: VisitHistoryCubit.get(context)..getUserVisitHistory()..pageination(),
  child: BlocConsumer<VisitHistoryCubit, VisitHistoryState>(
        listener: (context, state) {
          if(state is VisitHistoryDetailsLoading)
            {
              customEasyLoading();
            }else if(state is VisitHistoryDetailsSuccess)
              {
                EasyLoading.dismiss();
                showDialog(
                  context: context,
                  builder: (_)
                  {
                    return AlertDialog(
                      backgroundColor: LayoutCubit.get(context).isDark?ColorsManager.grayDark: ColorsManager.white,
                      content:
                      SingleChildScrollView(
                        child: ListBody(
                          children:
                          [
                            ListTile(
                              leading:  Icon(Icons.location_on , color: colorIcon,),
                              title: Text(state.visitHistoryModelDetailes.data!.garage!.address! ,
                                style: TextStyleManager.textStyle16w700.copyWith(
                                  color: colorText

                                ),),
                            ),
                            ListTile(
                              leading:  Icon(Icons.report , color: colorIcon,),
                              title: Text( state.visitHistoryModelDetailes.data!.reason!,
                                style: TextStyleManager.textStyle16w700.copyWith(
                                  color: colorText
                                ),),
                            ),
                            CustomElevatedButton(text: "phone".tr(), onPressed: ()
                            {
                              final Uri tel = Uri(
                                scheme: 'tel',
                                path: state.visitHistoryModelDetailes.data!.garage!.phone!,
                                queryParameters: <String, String>{
                                  'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
                                },
                              );
                              launchUrl(tel);

                            },),
                          ],
                        ),
                      ),
                    );
                  },);
              }else if(state is VisitHistoryDetailsError)
                {
                  EasyLoading.dismiss();

                }
        },
        builder: (context, state) {
          if(state is VisitHistoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is VisitHistoryError) {
            return  const CustomErrorWidget();
          }else  if (VisitHistoryCubit.get(context).visitHistoryModel != null) {
            if(VisitHistoryCubit.get(context).visitHistoryModel!.data!.isEmpty)
              {
               return const CustomEmptyData();
              }
                else
              {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView.separated(
                  controller: VisitHistoryCubit.get(context).scrollController,
                  itemCount: VisitHistoryCubit.get(context).
                  visitHistoryModel!.data!.length,
                  itemBuilder: (context, index)
                  {
                    return
                      Card(
                        color: LayoutCubit.get(context).isDark?ColorsManager.grayDark: ColorsManager.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0.r),
                          ),
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onTap: ()
                            {
                              VisitHistoryCubit.get(context).
                              getUserHistoryDetails(
                                  VisitHistoryCubit.get(context).visitHistoryModel!.data![index].id!);
                            },

                            child: Column(
                              children: [
                                ListTile(
                                  leading:  Icon(Icons.garage ,color:LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.primaryColor
                            ,),
                                  title: Text(VisitHistoryCubit.get(context).visitHistoryModel!.data![index].garage!.name! ,
                                    style: TextStyleManager.textStyle16w700.copyWith(
                                        color:LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.gray

                                    ),),

                                ),
                                ListTile(
                                  leading:  Icon(Icons.calendar_today ,color:colorIcon),
                                  title: Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(VisitHistoryCubit.get(context).visitHistoryModel!.data![index]!.createdAt!)),
                                      style: TextStyleManager.textStyle16w700.copyWith(
                                          color:LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.gray
                                      )
                                  ),
                                ),

                              ],
                            ),
                          )
                      );
                  }, separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 10.h,),),
              );
            }

              }
          else{
            return  Center(
              child: Text("No Data".tr()),
            );
          }
        },
      ),
),
    );
  }
}
