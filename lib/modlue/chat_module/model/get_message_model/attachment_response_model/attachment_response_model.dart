import 'package:equatable/equatable.dart';

class Attachments extends Equatable {
  Attachments({
    String? url,
    String? mimeType,
    String? type,
    String? cachedMediaPath,
  }) {
    _url = url;
    _mimeType = mimeType;
    _type = type;
    _cachedMediaPath = cachedMediaPath;
  }

  Attachments.fromJson(dynamic json) {
    _url = json['url'];
    _mimeType = json['mimeType'];
    _type = json['type'];
    _cachedMediaPath = json['cachedMediaPath'] ?? "";
  }

  String? _url;
  String? _mimeType;
  String? _type;
  String? _cachedMediaPath;

  Attachments copyWith({
    String? url,
    String? mimeType,
    String? type,
    String? cachedMediaPath,
  }) =>
      Attachments(
        url: url ?? _url,
        mimeType: mimeType ?? _mimeType,
        type: type ?? _type,
        cachedMediaPath: cachedMediaPath ?? _cachedMediaPath,
      );

  String? get url => _url;

  String? get mimeType => _mimeType;

  String? get type => _type;

  String? get cachedMediaPath => _cachedMediaPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['mimeType'] = _mimeType;
    map['type'] = _type;
    map['cachedMediaPath'] = _cachedMediaPath;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        url,
        mimeType,
        type,
        cachedMediaPath,
      ];
}
