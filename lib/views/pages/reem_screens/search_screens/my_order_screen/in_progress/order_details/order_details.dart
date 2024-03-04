import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../component/app_button.dart';
import '../../../../core/app_colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order Details ",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkBlue),
        ),
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon:  Icon(Icons.arrow_back_ios_new,color: AppColors.pink,),),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Row(children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 2),
              decoration: BoxDecoration(color: AppColors.greyScale,),
              child: Text(
                'logo store',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 17,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: 13,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Name Store',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2,),
              Text(
                'Branch name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2,),
              Text(
                'Total 40 LE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 17,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],)
          ],),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
                itemBuilder: (context,index){
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(children: [
                        Container(
                          width: 70,
                          height: 56,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://via.placeholder.com/70x56"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                          'Large Big tasty meal',
                          style: TextStyle(
                            color: AppColors.darkBlue,
                            fontSize: 14,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(
                            '2x6.80',
                            style: TextStyle(
                              color:AppColors.greyScale,
                              fontSize: 13,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                         SizedBox(width: 160.w,),
                          Text(
                            '\$13.60',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.pink,
                              fontSize: 13,
                              fontFamily: 'Work Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],)],)
                      ],),
                    ),

                    Container(
                     width: double.infinity,
                      height: 1,
                      decoration: BoxDecoration(color: AppColors.midGrey),
                    ),

                  ],
                );

            }),
          ),
         // SizedBox(height: 19,),
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(color: AppColors.midGrey),
          ),
          SizedBox(height: 30.h,),
          Text(
            'Delivery info:\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w600,
              height: 0.07,
            ),
          ),
          SizedBox(height: 15.h,),
          Container(
            width: 104,
            height: 104,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/104x104"),
                fit: BoxFit.cover,
              ),
              shape: OvalBorder(
                side: BorderSide(width: 2, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          Text(
            'delivery Name',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w500,
              height: 0.07,
            ),
          ),SizedBox(height: 30.h,),
          AppButton(text: "Show Tracking", onTap: (){}),SizedBox(height: 30.h,),
          Text(
            'Total All Order \$32.60',
            style: TextStyle(
              color: Color(0xFF222B45),
              fontSize: 20,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w600,
              height: 0.07,
            ),
          )
          ,SizedBox(height: 30.h,),
        ],),
      ),
    );
  }
}
