String getMediaType(String fileExtension) {
  List<String> audioExtensions = ['mp3', 'wav', 'ogg', 'aac'];
  List<String> videoExtensions = [
    'mp4',
    'avi',
    'mkv',
    'mov',
    'qt',
    'wmv',
    'flv',
    'webm',
    'm4v',
    'mpeg',
    'mpg',
    '3gp',
    '3g2',
    'mxf',
    'roq',
    'nsv',
    'f4v',
    'f4p',
    'f4a',
    'f4b',
    'm4b',
    'm4r',
    '3gp2',
    '3gpp',
    '3gpp2',
    'mpg2',
    'mp2v',
    'mpe',
    'ts',
    'mpegts',
    'm2ts',
    'mts',
    'tts',
    'm2t',
    'mts',
  ];
  List<String> imageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'bmp',
    'gif',
    'webp',
    'heic',
    'heif',
    'tiff',
    'tif'
  ];

  if (audioExtensions.contains(fileExtension)) {
    return 'audio';
  } else if (videoExtensions.contains(fileExtension)) {
    return 'video';
  } else if (imageExtensions.contains(fileExtension)) {
    return 'image';
  } else {
    return 'Unknown';
  }
}
