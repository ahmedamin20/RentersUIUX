import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../core/app_colors.dart';
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
        title: Text("My Request", style: TextStyleManager.textStyle16w500),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'OutComing Request'),
            Tab(text: 'Incoming Request'),
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
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  InProgressScreen(status: 1),
                  InProgressScreen(
                    status: 0,
                  ),
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
