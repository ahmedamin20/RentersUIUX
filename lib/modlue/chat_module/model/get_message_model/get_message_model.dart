import 'package:equatable/equatable.dart';

import 'response_message_model/response_messaeg_model.dart';

/// data : {"id":296,"fromUserId":36,"toUserId":"2","body":"hello bro viedo","fromLoggedUser":true,"seen":false,"updatedBefore":false,"createdAt":"2023-08-07T08:48:00.817907Z","attachments":[{"url":"https://api.pharosocail.com/storage/336/xyd9qslpwbO2Qjf.mp4","mimeType":"video/mp4","type":"video","cachedMediaPath":"d:/main.jpg"}]}
/// message : "Message Created Successfully"
/// code : 201
/// type : "success"

class GetMessageModel extends Equatable {
  GetMessageModel({
    ResponseMessageModel? data,
    String? message,
    num? code,
    String? type,
  }) {
    _data = data;
    _message = message;
    _code = code;
    _type = type;
  }

  GetMessageModel.fromJson(dynamic json) {
    _data = json['data'] != null
        ? ResponseMessageModel.fromJson(json['data'])
        : null;
    _message = json['message'];
    _code = json['code'];
    _type = json['type'];
  }

  ResponseMessageModel? _data;
  String? _message;
  num? _code;
  String? _type;

  GetMessageModel copyWith({
    ResponseMessageModel? data,
    String? message,
    num? code,
    String? type,
  }) =>
      GetMessageModel(
        data: data ?? _data,
        message: message ?? _message,
        code: code ?? _code,
        type: type ?? _type,
      );

  ResponseMessageModel? get data => _data;

  String? get message => _message;

  num? get code => _code;

  String? get type => _type;

  @override
  // TODO: implement props
  List<Object?> get props => [
        _data,
        _message,
        _code,
        _type,
      ];
}

/// id : 296
/// fromUserId : 36
/// toUserId : "2"
/// body : "hello bro viedo"
/// fromLoggedUser : true
/// seen : false
/// updatedBefore : false
/// createdAt : "2023-08-07T08:48:00.817907Z"
/// attachments : [{"url":"https://api.pharosocail.com/storage/336/xyd9qslpwbO2Qjf.mp4","mimeType":"video/mp4","type":"video","cachedMediaPath":"d:/main.jpg"}]

/// url : "https://api.pharosocail.com/storage/336/xyd9qslpwbO2Qjf.mp4"
/// mimeType : "video/mp4"
/// type : "video"
/// cachedMediaPath : "d:/main.jpg"
