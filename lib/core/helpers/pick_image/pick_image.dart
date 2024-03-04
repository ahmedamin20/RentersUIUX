import 'package:image_picker/image_picker.dart';

class PickImageHelper
{
  PickImageHelper._();
  static PickImageHelper pickImageHelper = PickImageHelper._();
  final ImagePicker picker = ImagePicker();
  Future<XFile?> pickImage() async
  {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
  Future<XFile?> pickCamera() async
  {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
}