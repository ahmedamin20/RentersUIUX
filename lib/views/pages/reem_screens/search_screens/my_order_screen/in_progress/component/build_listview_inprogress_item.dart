import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/view_model/cubit/requests_cubit/requests_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';

import '../../../../../../../core/resource/text_style_manager.dart';
import '../../../../../../../data/model/show_order_model/show_order_model.dart';
import '../../../../component/app_button.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/image_path.dart';
import '../order_details/order_details.dart';

class BuildListViewInProgressItem extends StatelessWidget {
  BuildListViewInProgressItem({Key? key, required this.baseShowOrderModel})
      : super(key: key);
  BaseShowOrderModel baseShowOrderModel;
  String getStatus(int status) {
    switch (status) {
      case 0:
        return 'PENDING ';
      case 1:
        return 'RENTING ';
      case 2:
        return 'REJECTED ';
      case 3:
        return 'FINISHED ';
      case 4:
        return 'CANCELED  ';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
      child: Container(
        padding: const EdgeInsets.only(
          top: 7,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        decoration: ShapeDecoration(
          color: AppColors.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0A121212),
              blurRadius: 16,
              offset: Offset(4, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Request number: ',
                          style: TextStyleManager.textStyle12w700
                              .copyWith(color: ColorsManager.primaryColor),
                        ),
                        TextSpan(
                          text: baseShowOrderModel.id.toString(),
                          style: TextStyleManager.textStyle12w700
                              .copyWith(color: ColorsManager.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8.5),
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "  ${getStatus(baseShowOrderModel.status!)}",
                      style: TextStyleManager.textStyle12w700
                          .copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Date From: ',
                      style: TextStyleManager.textStyle12w700
                          .copyWith(color: ColorsManager.primaryColor),
                    ),
                    TextSpan(
                      text: baseShowOrderModel.fromDate,
                      style: TextStyleManager.textStyle12w700
                          .copyWith(color: ColorsManager.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Date to: ',
                      style: TextStyleManager.textStyle12w700
                          .copyWith(color: ColorsManager.primaryColor),
                    ),
                    TextSpan(
                      text: baseShowOrderModel.toDate,
                      style: TextStyleManager.textStyle12w700
                          .copyWith(color: ColorsManager.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 14,
              ),
              AppButton(
                  text: "Request details",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Text('Order Details'),
                                ),
                                body: ListView(children: [
                                  UserDetailsWidget(
                                      user: baseShowOrderModel.toUser!),
                                  ProductDetailsWidget(
                                      data: baseShowOrderModel),
                                ]),
                              )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class UserDetailsWidget extends StatelessWidget {
  ToUser user;
  UserDetailsWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'User Details',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            _buildInfoRow('ID', user.id.toString()),
            _buildInfoRow('Name', user.name!),
            _buildInfoRow('Status', user.status! ? 'Active' : 'Inactive'),
            _buildInfoRow(
                'Identity Verified', user.identityVerified! ? 'Yes' : 'No'),
            _buildInfoRow('Email', user.email!),
            _buildInfoRow('Type', user.type!),
            // _buildInfoRow('Front National ID', user['front_national_id'] ?? 'N/A'),
            // _buildInfoRow('Back National ID', user['back_national_id'] ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: ColorsManager.primaryColor,
            ),
          ),
          const SizedBox(width: 12.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: ColorsManager.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsWidget extends StatelessWidget {
  final BaseShowOrderModel data;

  ProductDetailsWidget({required this.data});

  String getStatus(int status) {
    switch (status) {
      case 0:
        return 'PENDING ';
      case 1:
        return 'RENTING ';
      case 2:
        return 'REJECTED ';
      case 3:
        return 'FINISHED ';
      case 4:
        return 'CANCELED  ';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestsCubit, RequestsState>(
      listener: (context, state) {
        if (state is RequestsAcceptError || state is CancelOrderError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Error")));
          EasyLoading.dismiss();
        } else if (state is RequestsAcceptSuccess ||
            state is CancelOrderSuccess) {
          EasyLoading.dismiss();
          context.pop();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Success")));
          context.read<RequestsCubit>().getOrder(1);
        } else if (state is RequestsOrderLoading ||
            state is CancelOrderLoading) {
          customEasyLoading();
        }
      },
      builder: (context, state) {
        return Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Product Details',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                _buildProductDetails(data.product!),
                _buildInfoRow('ID', data.id.toString()),
                _buildInfoRow('Price', '\$${data.price.toString()}'),
                _buildInfoRow(
                    'Status', '${getStatus(data.status!)}(${data.status})'),
                _buildInfoRow('Created At', data.createdAt!),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    (data.fromUser != null && data.status == 0)
                        ? Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<RequestsCubit>()
                                      .acceptOrder(data.id!);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsManager.primaryColor,
                                    textStyle: TextStyle(color: Colors.white)),
                                child: const Text("Accept",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                              const SizedBox(width: 16.0),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      textStyle:
                                          const TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    context
                                        .read<RequestsCubit>()
                                        .rejectOrder(data.id!);
                                  },
                                  child: const Text("Reject",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ))),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(width: 16.0),
                    (data.fromUser == null && data.status == 0)
                        ? Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    textStyle: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  context
                                      .read<RequestsCubit>()
                                      .cancelOrder(data.id!);
                                },
                                child: const Text("Cancel",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ))),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: ColorsManager.primaryColor,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              color: ColorsManager.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails(ProductOrder product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.network(product.mainImage!, height: 150),
        SizedBox(height: 16.0),
        _buildInfoRow('Product Name', product.name!),
        _buildInfoRow('Rating Average', product.ratingAverage.toString()),
        _buildInfoRow('Health', product.health.toString()),
        _buildInfoRow('Category', product.category!.name!),
        _buildInfoRow('Description', product.description!),
      ],
    );
  }
}
