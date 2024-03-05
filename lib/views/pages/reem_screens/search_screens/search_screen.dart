import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';

import '../core/app_colors.dart';
import '../core/image_path.dart';
import 'component/build_listview_search_item.dart';
import 'my_order_screen/my_order_screen_layout.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  List<SearchItem> item = searchItems;

  void search(String query) {
    final suggestion = searchItems.where((item) {
      final foodTitle = item.title.toLowerCase();
      final input = query.toLowerCase();
      return foodTitle.contains(input);
    }).toList();
    setState(() {
      item = suggestion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 45.h, right: 16.w, left: 16.w),
        child: Column(
          children: [
            SizedBox(
                height: 50.h,
                child: const CustomTextFormField(textHint: TextManager.searsh)),
          
          Text("Soon"),
            // Expanded(
            //     child: ListView.separated(
            //   itemCount: item.length,
            //   itemBuilder: (context, index) {
            //     final searchItems = item[index];
            //     return InkWell(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const MyOrderScreenLayOut()));
            //       },
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             width: 80,
            //             height: 64,
            //             decoration: ShapeDecoration(
            //               image: DecorationImage(
            //                 image: NetworkImage(searchItems.urlImage),
            //                 fit: BoxFit.fill,
            //               ),
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(8)),
            //             ),
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SizedBox(
            //                 height: 12.h,
            //               ),
            //               Text(searchItems.title,
            //                   style: TextStyleManager.textStyle14w500),
            //               SizedBox(
            //                 height: 2.h,
            //               ),
            //               Text(
            //                 searchItems.description,
            //                 style: TextStyleManager.textStyle12w400.copyWith(
            //                   color: ColorsManager.primaryColor,
            //                 ),
            //                 maxLines: 5,
            //                 overflow: TextOverflow.ellipsis,
            //                 softWrap: false,
            //               ),
            //               SizedBox(
            //                 height: 10.h,
            //               ),
            //               Text(searchItems.price,
            //                   style: TextStyleManager.textStyle14w500),
            //               SizedBox(
            //                 height: 12.h,
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     );
            //   },
            //   separatorBuilder: (BuildContext context, int index) => Container(
            //     width: 343.w,
            //     height: 1.h,
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 16.w,
            //     ),
            //     decoration:
            //         const BoxDecoration(color: ColorsManager.greyScale600),
            //   ),
            // ))
      
      
          ],
        ),
      ),
    );
  }
}
