import 'dart:ui';

import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/data/model/user_model/user_model.dart';

import '../../../../core/helpers/cach_helpers/cach_helpers.dart';

List<String> videoExtensions =
[
  'mp4',
  'avi',
  'mov',
  'mkv',
  'wmv',
  'flv',
  'webm',
  'm4v',
  'mpg',
  'mpeg',
  '3gp',
];

List<String> imageExtensions = [
  'jpg',
  'jpeg',
  'png',
  'gif',
  'bmp',
  'tiff',
  'svg',
  'webp',
  'ico',
  'raw',
  'psd',
];

int? idUser;
String token = CacheHelper.get(key: 'token') ?? '';

String? pusherID;
String? pusherHost;
String? pusherAuth;
Color? primaryColor = ColorsManager.primaryColor;


UserModel? globalUserModel;
