    import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';

final emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final phoneRegex = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
final passwordRegex = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
final fullNameRegex = RegExp(r'^[A-Za-z\s]{1,50}$');
final urlRegex = RegExp(r'^(http|https):\/\/[a-zA-Z0-9\-\.]+(\.[a-zA-Z]{2,})(:[0-9]+)?(\/[^\s]*)?$',);
    const String curreny = "FCFA";

    const TECHNICAL = '1';
    const PENDING = '2';
    const APPROVED = '3';
    const DECLINED = '4';
    const PROCESSING = '5';
    const FINISHED = '6';

    String getCarFixStatus(String status)
    {
      switch (status) {
        case TECHNICAL:
          return 'Technical';
        case PENDING:
          return 'Pending';
        case APPROVED:
          return 'Approved';
        case DECLINED:
          return 'Declined';
        case PROCESSING:
          return 'Processing';
        case FINISHED:
          return 'Finished';
        default:
          return 'Unknown';
      }
    }
    Color getColorFixStatus(String status)
    {
      switch (status) {
        case TECHNICAL:
          return ColorsManager.redColor;
        case PENDING:
            return Colors.yellow;
        case APPROVED:
          return ColorsManager.green;
        case DECLINED:
          return ColorsManager.redColor;
        case PROCESSING:
          return Colors.yellow;
        case FINISHED:
          return ColorsManager.gray;
        default:
          return ColorsManager.redColor;
      }
    }