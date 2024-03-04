import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../core/app_colors.dart';
import 'canceled/canceled_screen.dart';
import 'completed/completed_screen.dart';
import 'in_progress/in_progress_screen.dart';

class MyOrderScreenLayOut extends StatefulWidget {
  const MyOrderScreenLayOut({Key? key}) : super(key: key);

  @override
  State<MyOrderScreenLayOut> createState() => _MyOrderScreenLayOutState();
}

class _MyOrderScreenLayOutState extends State<MyOrderScreenLayOut>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My orders", style: TextStyleManager.textStyle16w500),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'In Progress'),
            Tab(text: 'Completed'),
            Tab(text: 'Canceled'),
          ],
          indicatorColor: AppColors.pink,
          labelColor: AppColors.pink,
          unselectedLabelColor: AppColors.greyScale,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 33),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   child: Container(
            //     padding:
            //     const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //         color: AppColors.lightGrey,
            //         borderRadius: BorderRadius.circular(50)),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         buildButton(1, '1'),
            //         buildButton(2, '2'),
            //         buildButton(3, '3'),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  InProgressScreen(),
                  CompletedScreen(),
                  CanceledScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(int pageIndex, String buttonText) {
    return MaterialButton(
      onPressed: () {
        _tabController.animateTo(pageIndex - 1);
      },
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: _tabController.index == pageIndex - 1
                    ? AppColors.pink
                    : AppColors.greyScale,
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            height: 2.h,
            width: 30.w,
            color: _tabController.index == pageIndex - 1
                ? AppColors.pink
                : AppColors.lightGrey,
          )
        ],
      ),
    );
  }
}
