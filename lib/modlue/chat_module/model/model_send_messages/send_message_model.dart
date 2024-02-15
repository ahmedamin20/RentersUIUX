class SendMessageModel {
  String? body;
  String? toUserId;
  String? media;
  String? cachedMediaPath;
  String? createdAt;
  String? localId;

  SendMessageModel(
      {this.body,
      this.toUserId,
      this.media,
      this.cachedMediaPath,
      this.createdAt,
      this.localId});

  Map<String, dynamic> toMap() {
    return {
      "body": body,
      "to_user_id": toUserId,
      "media": media,
      "cached_media_path": cachedMediaPath,
      "local_id": localId,
    };
  }
}
