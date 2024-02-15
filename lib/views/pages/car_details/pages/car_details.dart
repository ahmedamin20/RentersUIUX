//
// import 'package:chewie/chewie.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:go_router/go_router.dart';
// import 'package:ksb/core/resource/colors_manager.dart';
// import 'package:ksb/core/resource/text_manager.dart';
// import 'package:ksb/core/resource/text_style_manager.dart';
// import 'package:ksb/view_model/cubit/car_fixes_cubit/car_fixes_cubit.dart';
// import 'package:ksb/view_model/cubit/information_cubit/information_cubit.dart';
// import 'package:ksb/views/componants/custom_app_bar/custom_app_bar.dart';
// import 'package:ksb/views/componants/custom_cached_network_image/custom_cached_network_image.dart';
// import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
// import 'package:ksb/views/componants/custom_elevated_button.dart';
// import 'package:ksb/views/componants/custom_text_form_field.dart';
// import 'package:readmore/readmore.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:video_player/video_player.dart';
//
// import '../../../../core/constants.dart';
// import '../../../../view_model/cubit/layout_cubit/layout_cubit.dart';
//
// class CarDetialesView extends StatelessWidget {
//   const CarDetialesView({super.key, required this.id,
//
//     required this.cubit,
//     required  this.carName,
//   });
//
//   final int id;
//   final CarFixesCubit cubit;
//   final String carName;
//
//   final int activeStep = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     Color colorText =LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.blackColor;
//     return BlocProvider.value(
//       value: cubit..getCarFixDetails(id),
//       child: Scaffold(
//         appBar: AppBarCustom(
//           title: carName,
//         ),
//         body: BlocConsumer<CarFixesCubit, CarFixesState>
//           (
//           listener: (context, state) {
//             // TODO: implement listener
//           },
//           builder: (context, state) {
//             CarFixesCubit cubit = CarFixesCubit.get(context);
//             if (state is GetCarFixesDetailsLoadingState) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             else if (CarFixesCubit
//                 .get(context)
//                 .carFixDetailsModel != null)
//             {
//
//               return Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: 100, left: 25, right: 25),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: AnimationLimiter(
//                     child: ListView(
//                         children:AnimationConfiguration.
//                         toStaggeredList(
//                           duration: const Duration(milliseconds: 700),
//                             childAnimationBuilder: (widget) => SlideAnimation(
//                               horizontalOffset: 50.0,
//                               child: FadeInAnimation(
//                                 child: widget,
//                               ),
//                             ),
//                           children:  [
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             SizedBox(
//                               height: 200.h,
//                               child: PageView.builder(
//                                 itemCount: cubit.carFixDetailsModel!.data!.images!.length,
//                                 itemBuilder: (context, index) {
//                                 return CustomCachedNetworkImage(
//                                   url: cubit.carFixDetailsModel!.data!.images![index].url!,
//                                 );
//                               },),
//                             ),
//                             SizedBox(height: 20.h),
//                              (cubit.carFixDetailsModel!.data!.video!=null)?CustomVideoWidget(url: cubit.carFixDetailsModel!.data!.video!,) : SizedBox(),
//                             Row(
//                               children: [
//                                 Text(
//                                   "Car Progresses".tr(),
//                                   style: TextStyleManager.textStyle18w700,
//                                 ),
//                                 const Spacer(),
//                                 Text(getCarFixStatus(cubit.carFixDetailsModel!.data!.status!).tr(),
//                                   style: TextStyleManager.textStyle18w700.copyWith(
//                                       color: getColorFixStatus(cubit.carFixDetailsModel!.data!.status!)
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   "created At : ".tr(),
//                                   style: TextStyleManager.textStyle18w700.copyWith(color:colorText),
//                                 ),
//                                 const Spacer(),
//                                 Text( cubit.carFixDetailsModel!.data!.createdAt!,
//                                   style: TextStyleManager.textStyle12w500.copyWith(
//                                       color: ColorsManager.gray
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "reason : ".tr(),
//                                   style: TextStyleManager.textStyle18w700.copyWith(color: colorText),
//                                 ),
//
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text( cubit.carFixDetailsModel!.data!.visit!.reason!,
//                                     style:  TextStyleManager.textStyle16w500.copyWith(color: colorText),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             // CustomCardMyCar(
//                             //   function: () {
//                             //     // context.push(AppRouter.cardetails);
//                             //   },
//                             // ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Text(
//                               "Visitor Car".tr(),
//                               style: TextStyleManager.textStyle18w700.copyWith(color: colorText),
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Card(
//                               color: LayoutCubit.get(context).isDark?ColorsManager.grayDark: ColorsManager.white,
//                               elevation: 10.0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child:Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children:
//                                 [
//                                   ListTile(
//                                     trailing:   Text(
//                                         cubit.carFixDetailsModel!.data!.visitorCar!.carModel!,
//                                         style: TextStyleManager.textStyle12w500.copyWith(color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.gray)
//                                     ),
//                                     title: Text(
//                                       cubit.carFixDetailsModel!.data!.visitorCar!.carLicense!,
//                                       style:  TextStyle(
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.bold,
//                                         color: colorText
//                                       ),
//                                     ),
//                                     subtitle: Text(
//                                       cubit.carFixDetailsModel!.data!.visitorCar!.color!.name!,
//                                       style: TextStyleManager.textStyle12w500.copyWith(color: colorText),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Text(
//                               "Report".tr(),
//                               style: TextStyleManager.textStyle18w700.copyWith(color: colorText),
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Card(
//                               color: LayoutCubit.get(context).isDark?ColorsManager.grayDark: ColorsManager.white,
//                               elevation: 10.0,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               child:Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children:
//                                   [
//                                     Text.rich(
//                                       TextSpan(
//                                         text: 'Total Fix Amount :'.tr(),
//                                         style: TextStyleManager.textStyle16w700.copyWith(color: colorText),
//                                         children: <TextSpan>[
//                                           TextSpan(
//                                             text: '${cubit.carFixDetailsModel!.data!.totalFixAmount}',
//                                             style: TextStyleManager.textStyle16w500.copyWith(
//                                               color: colorText
//                                             ) ,),
//                                           TextSpan(
//                                             text: '  $curreny',
//                                             style: TextStyleManager.textStyle12w500.copyWith(
//                                               color: colorText
//                                             ) ,),
//                                         ],
//                                       ),
//
//                                     ),
//                                     SizedBox(
//                                       height: 10.h,),
//                                     Text.rich(
//                                       TextSpan(
//                                         text: 'Paid Amount : '.tr(),
//                                         style: TextStyleManager.textStyle16w700.copyWith(
//                                             color: colorText
//                                         ),
//                                         children: <TextSpan>[
//                                           TextSpan(
//                                             text: '${cubit.carFixDetailsModel!.data!.paidAmount}',
//                                             style: TextStyleManager.textStyle16w500.copyWith(
//                                               color: colorText
//                                             ) ,),
//                                           TextSpan(
//                                             text: '  $curreny',
//                                             style: TextStyleManager.textStyle12w500.copyWith(
//                                                 color: colorText
//                                             ) ,),
//                                         ],
//                                       ),
//
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             Text(
//                               "Details".tr(),
//                               style: TextStyleManager.textStyle18w700.copyWith(color: colorText),
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             ReadMoreText(
//                               cubit.carFixDetailsModel!.data?.malfunctionDescription ?? "No Description".tr(),
//                               style:TextStyleManager.textStyle14w500.copyWith(color: colorText),
//                               trimLines: 2,
//                               colorClickableText: Colors.pink,
//                               trimMode: TrimMode.Line,
//                               trimCollapsedText: 'Show more'.tr(),
//                               trimExpandedText: 'Show less'.tr(),
//                               moreStyle:  TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.bold,
//                               color: colorText
//                               ),
//                             ) ,
//                             (cubit.carFixDetailsModel!.data!.status == FINISHED)?CustomElevatedButton(
//                             text: TextManager.downloadInvoice, onPressed: ()
//                             {
//                               cubit.downloadPDF(cubit.carFixDetailsModel!.data!.id!.toInt());
//                             }) : const SizedBox.shrink(),
//                           ],
//                         )),
//                   ),
//                 ),
//               );
//             } else {
//               return  Text("Error".tr());
//             }
//           },
//         ),
//         bottomSheet: BlocConsumer<CarFixesCubit, CarFixesState>(
//           listener: (context, state)
//           {
//             if(state is SendApproveSuccessState)
//               {
//
//                 if(cubit.status == 1)
//                   {
//                     cubit.carFixDetailsModel!.data!.status = "3";
//                     if(cubit.carFixesModel!=null)
//                       {
//                         for (var element in cubit.carFixesModel!.data!)
//                         {
//                           if(element.id == cubit.carFixDetailsModel!.data!.id)
//                           {
//                             int index = cubit.carFixesModel!.data!.indexOf(element);
//                             cubit.carFixesModel!.data![index].status = "3";
//                             break;
//                           }
//                         }
//                       }
//
//
//
//                   }else
//                   {
//                     cubit.carFixDetailsModel!.data!.status = "4";
//                     if(cubit.carFixesModel!=null)
//                       {
//                         for (var element in cubit.carFixesModel!.data!) {
//                           if(element.id == cubit.carFixDetailsModel!.data!.id)
//                           {
//                             int index = cubit.carFixesModel!.data!.indexOf(element);
//                             cubit.carFixesModel!.data![index].status = "4";
//                             break;
//                           }
//                         }
//
//                       }
//
//                   }
//                 EasyLoading.dismiss();
//                 Navigator.pop(context);
//               }else if(state is SendApproveLoadingState)
//                 {
//                   customEasyLoading();
//                 }else if(state is SendApproveErrorState)
//                   {
//                     EasyLoading.dismiss();
//                     EasyLoading.showError(state.error);
//                   }
//             else if(state is SendReviewLoadingState)
//               {
//                 customEasyLoading();
//               }else if(state is SendApproveSuccessState)
//                 {
//                   EasyLoading.dismiss();
//                   EasyLoading.showSuccess(state.message);
//                   Navigator.pop(context);
//                 }else if(state is SendReviewErrorState)
//                   {
//                     EasyLoading.dismiss();
//                     EasyLoading.showError(state.error);
//                   }else if(state is SendReviewSuccessState)
//                     {
//                       cubit.carFixDetailsModel!.data!.reviewed = true;
//                       EasyLoading.dismiss();
//                       EasyLoading.showSuccess("Review Sent Successfully".tr());
//                       Navigator.pop(context);
//                     }
//             // TODO: implement listener
//           },
//           builder: (context, state)
//           {
//             CarFixesCubit cubit = CarFixesCubit.get(context);
//             if(cubit.carFixDetailsModel!=null)
//               {
//                 return Container(
//                   color: LayoutCubit.get(context).isDark?
//                   ColorsManager.blackColor: ColorsManager.white,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: Row(
//                         children: [
//                           (cubit.carFixDetailsModel!.data!.status == "2")?
//                           Expanded(
//                             child: CustomElevatedButton(
//                               onPressed: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return AlertDialog(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(10.r)
//                                         ),
//                                         backgroundColor: LayoutCubit.get(context).isDark?
//                                         ColorsManager.grayDark: ColorsManager.white,
//                                         // title:  Text("Are you sure ?".tr() ,
//                                         //   style: TextStyleManager.textStyle24w700.copyWith(
//                                         //       color: LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.grayDark ),
//                                         // ),
//                                         content:  Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children:
//                                           [
//                                             Text(
//                                               "Are you sure you want to accept this offer ?".tr(),
//                                               style: TextStyleManager.textStyle12w500.copyWith(
//                                                   color: LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.grayDark ),
//                                             ),
//                                              Text("Terms and Conditions".tr()),
//
//                                             Text(InformationCubit.get(context).termsAndCondationModel!.data!.clientTerms!,
//                                               style: TextStyleManager.textStyle14w500.copyWith(
//                                                   color: LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.grayDark ),
//                                             ),
//                                             Row(
//
//                                               children:
//                                               [
//
//                                                 BlocProvider.value(
//                                                   value: cubit,
//                                       child: BlocConsumer<CarFixesCubit, CarFixesState>(
//                                        listener: (context, state)
//                                                {
//                                                    // TODO: implement listener
//                                                 },
//                                              builder: (context, state) {
//                                                  return
//                                                    Checkbox(
//                                                     // shape: RoundedRectangleBorder(
//                                                     //     borderRadius: BorderRadius.circular(10.r)
//                                                     // ),
//                                                     fillColor: MaterialStateProperty.all<Color>(LayoutCubit.get(context).isDark?Colors.white:ColorsManager.blackColor),
//                                                     side: const BorderSide(color: ColorsManager.green),
//                                                     value: cubit.isCheck,
//                                                     onChanged: (value)
//                                                     {
//                                                       print(value);
//                                                       cubit.isCheck = value!;
//                                                       cubit.emit(AcceptCarFixesTerms());
//
//                                                     });
//   },
// ),
// ) ,
//                                                 Text("Accept Terms And conditions".tr() ,
//                                                   style: TextStyleManager.textStyle12w500.copyWith(
//                                                       color: LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.grayDark ),
//
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                         actions: [
//                                           TextButton(
//                                               onPressed: ()
//                                               {
//                                                 cubit.getApproveOrRejectCarFixes(cubit.carFixDetailsModel!.data!.id!.toInt(), 0);
//                                               },
//                                               child:  Text("Rejected".tr() ,
//                                                   style: TextStyleManager.textStyle12w500.copyWith(
//                                                       color: ColorsManager.redColor
//                                                   )
//                                               )),
//                                           TextButton(
//                                               onPressed: ()
//                                               {
//                                                 if(cubit.isCheck)
//                                                   {
//                                                     cubit.getApproveOrRejectCarFixes(cubit.carFixDetailsModel!.data!.id!.toInt(), 1);
//
//                                                   }else{
//                                                   ScaffoldMessenger.of(context).showSnackBar(
//                                                     const SnackBar(content: Text("Please Accept the Terms And Conditions"))
//                                                   );
//                                                 }
//
//                                               },
//                                               child:  Text("Accept".tr() ,
//                                                 style: TextStyleManager.textStyle12w500.copyWith(
//                                                     color: ColorsManager.green
//                                                 ),)),
//                                           TextButton(
//                                               onPressed: ()
//                                               {
//                                                 context.pop();
//                                               },
//                                               child:  Text("Cancel".tr())),
//                                         ],
//                                       );
//                                     });
//                               },
//                               color: ColorsManager.green,
//                               text: 'Accept'.tr(),
//                             ),
//                           )
//                               :
//                           const SizedBox.shrink(),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           Expanded(
//                             child: CustomElevatedButton(
//                               onPressed: ()
//                               {
//                                 final Uri smsLaunchUri = Uri(
//                                   scheme: 'tel',
//                                   path: cubit.carFixDetailsModel!.data!.visit!.garageModel!.phone,
//
//                                 );
//                                 launchUrl(smsLaunchUri);
//
//                               },
//                               text: 'call'.tr(),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           (cubit.carFixDetailsModel!.data!.status! == '6'&&
//                               !cubit.carFixDetailsModel!.data!.reviewed! ) ?
//                           Expanded(
//                             child: CustomElevatedButton
//                               (
//                               onPressed: ()
//                               {
//                                 showDialog(context: context, builder:
//
//                                 (context)
//                                 {
//                                   return AlertDialog(
//                                     title: Text("Review".tr()),
//                                     content: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         CustomTextFormField(
//                                           maxLines: 5,
//                                           controller: cubit.reviewController,
//                                           textHint: "Review".tr(),
//
//                                           validator: (value)
//                                           {
//                                             if(value!.isEmpty)
//                                             {
//                                               return "Please Enter Your Review".tr();
//                                             }
//                                           }, prefixIcon: Icons.rate_review,
//                                         ),
//                                         CustomElevatedButton(text: "Send".tr(),
//                                             onPressed: ()
//                                         {
//                                           cubit.sendReview(cubit.carFixDetailsModel!.data!.id!.toInt());
//                                         })
//                                       ],
//                                     ),
//                                   );
//                                 },
//                                 );
//                               },
//                               text: 'Review'.tr(),
//                             ),
//                           ) : const SizedBox.shrink(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }else if(state is GetCarFixesDetailsLoadingState)
//                 {
//                   return const SizedBox();
//                 }
//             else{
//              return Text("Error".tr());
//             }
//
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class CustomVideoWidget extends StatefulWidget {
//    CustomVideoWidget({super.key , required this.url});
//   String url;
//   @override
//   State<CustomVideoWidget> createState() => _CustomVideoWidgetState();
// }
//
// class _CustomVideoWidgetState extends State<CustomVideoWidget> {
//   VideoPlayerController  ?videoPlayerController ;
//     ChewieController? chewieController ;
//   bool isLoading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     videoPlayerController = VideoPlayerController.network(
//         widget.url);
//      videoPlayerController!.initialize().then((_) {
//       setState(() {
//         isLoading =true;
//       });
//     });
//     chewieController = ChewieController(
//       videoPlayerController: videoPlayerController!,
//       autoPlay: false,
//       looping: false,
//     );
//     super.initState();
//   }
//  @override
//  void dispose() {
//    // videoPlayerController!.dispose();
//    // chewieController!.dispose();
//    super.dispose();
//  }
//   @override
//   Widget build(BuildContext context)
//   {
//     return SizedBox(
//       height: 200.h,
//       width: double.infinity,
//       child: (isLoading)?  Chewie(
//         controller: chewieController!,
//       ) : const Center(child: CircularProgressIndicator(),),
//     );
//
//
//   }
// }
