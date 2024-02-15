import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  ImagePickerHelper._();

  static final ImagePickerHelper imagePickerHelper = ImagePickerHelper._();
  final picker = ImagePicker();
  FilePickerResult? result;
  XFile? file;

  Future<void> pickImageVideoUser() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowCompression: true,
      allowedExtensions: [
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
      ],
    );
    if (result != null) {
      file = XFile(result!.files.single.path!);
    } else {
      return;
      // User canceled the picker
    }
  }

  Future<XFile?> pickImageCamera() async {
    return picker.pickImage(source: ImageSource.camera);
  }
}
