import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import '../../../../../core/helpers/dio_helpers/dio_helpers.dart';
import '../../../core/failure/Failure.dart';
import '../../../model/get_message_model/response_message_model/response_messaeg_model.dart';
import '../../../model/model_send_messages/send_message_model.dart';

abstract class SendMessageRepo {
  Future<Either<Failure, ResponseMessageModel>> sendMessage(
      {required SendMessageModel sendMessageRequest});
}

class SendMessageRepoImpl extends SendMessageRepo {
  List<String> getTypeOfMedia(String url) {
    String type = url.split('.').last;
    if (isImage(url)) {
      return ["image ", type];
    } else if (isVideo(url)) {
      return ["video ", type];
    } else {
      return ["audio ", type];
    }
  }

  bool isVideo(String url) {
    final extension = path.extension(url).toLowerCase();
    return extension == '.mp4' ||
        extension == '.mov' ||
        extension == '.avi' ||
        extension == '.mkv' ||
        extension == '.webm' ||
        extension == '.flv' ||
        extension == '.wmv' ||
        extension == '.mpeg' ||
        extension == '.mpg';
  }

  bool isImage(String url) {
    final extension = path.extension(url).toLowerCase();
    return extension == '.jpg' ||
        extension == '.jpeg' ||
        extension == '.png' ||
        extension == '.bmp' ||
        extension == '.gif';
  }

  @override
  Future<Either<Failure, ResponseMessageModel>> sendMessage(
      {required SendMessageModel sendMessageRequest}) async {
    try {
      print("////////////////////////////////////");
      print(sendMessageRequest.toMap());
      print("////////////////////////////////////");
      FormData formData = FormData.fromMap({
        "to_user_id": sendMessageRequest.toUserId,
        'local_id': sendMessageRequest.localId
      });
      if (sendMessageRequest.body != null) {
        formData.fields.add(MapEntry("body", sendMessageRequest.body!));
      }
      if (sendMessageRequest.media != null) {
        formData.files.add(
            MapEntry(
            "media",
            await MultipartFile.fromFile(
              sendMessageRequest.media!,
              filename: sendMessageRequest.media!.split('/').last,
            )));
      }
      Response response = await DioHelper.postData(
          url: "/support_chat/messages",
          data: formData,
      );
      return Right(ResponseMessageModel.fromJson(response.data['data']));
    } on DioException catch (e) {
      print("/////////////serve/////////////////");
      print(e);
      print("////////////////////////////////////");
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      print("////////////// Local ////////////////");
      print(e);
      print("////////////////////////////////////");
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
