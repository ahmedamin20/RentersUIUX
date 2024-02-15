import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/services/app_router.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state)
      {
        if(state is ProductDetilesLoading)
          {
            customEasyLoading();
          }else if(state is ProductDetilesSuccess)
            {
              EasyLoading.dismiss();

              context.pop();
              context.push(AppRouter.detailsView  ,
                  extra: {
              "id": state.getProductDetilesModel!.data!.id
              });
            }else if(state is ProductDetilesError)
              {
                EasyLoading.dismiss();
                EasyLoading.showError(state.failure.toString());
              }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("QrScreen"),
          ),
          body: MobileScanner(
            fit: BoxFit.contain,
            controller: MobileScannerController(
              facing: CameraFacing.back,
              // torchEnabled: false,
              returnImage: true,
              autoStart: true,
              detectionTimeoutMs: 5000,

            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              final Uint8List? image = capture.image;

                ProductCubit.get(context).getProductDetiles(
                    int.parse(capture.barcodes[0].rawValue!));
                debugPrint('Barcode found! ${capture.barcodes[0].rawValue}');
                context.pop();
              if (image != null) {
                showDialog(
                  context: context,
                  builder: (context) =>
                      Image(image: MemoryImage(image)),
                );

              }
            },
          ),
        );
      },
    );
  }
}
