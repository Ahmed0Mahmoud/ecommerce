import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future uploadImageToAPI({required XFile image}) async {
  return MultipartFile.fromFile(
    image.path,
    filename: image.path.split('/').last,
  );
} // ميثود علشان ترفع الصورة
