import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ksb/core/helpers/dio_helpers/dio_helpers.dart';

part 'add_product_screen_state.dart';

class AddProductScreenCubit extends Cubit<AddProductScreenState> {
  AddProductScreenCubit() : super(AddProductScreenInitial());
  static AddProductScreenCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController minimumDays = TextEditingController();
  TextEditingController maximumDays = TextEditingController();
  TextEditingController health = TextEditingController();
  TextEditingController categpryID = TextEditingController();

  XFile? mainImage;
  List<XFile> otherImages = [];
  Future<void> pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        mainImage = value;
        emit(AddProductScreenPickImageSuccess());
      }
    });
  }

  Future<void> pickImageMutiImage() async {
    ImagePicker()
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    )
        .then((value) {
      if (value != null) {
        print(value);
        otherImages.add(value);

        print(otherImages.length);
        emit(AddProductScreenPickImageSuccess());
      }
    });
  }

  Future<void> sendData() async {
    emit(AddProductScreenLoading());
    FormData formData = FormData.fromMap({
      "name": nameController.text,
      "price": priceController.text,
      "description": descriptionController.text,
      "minimum_days": minimumDays.text,
      "maximum_days": maximumDays.text,
      "health": health.text,
      "category_id": 1,
      "main_image": await MultipartFile.fromFile(mainImage!.path),
    });
    formData.files.addAll(otherImages.map((e) => MapEntry(
        "otherImages[${otherImages.indexOf(e)}]",
        MultipartFile.fromFileSync(e.path))));
    await DioHelper.postData(url: "client/products", data: formData)
        .then((value) {
      emit(AddProductScreenSuccess());
    }).catchError((error) {
      if (error is DioError) {
        print(error.response!.data);
        emit(AddProductScreenError(error.response!.data));
      } else {
        print(error.toString());
        emit(AddProductScreenError(error.toString()));
      }
    });
  }
}
