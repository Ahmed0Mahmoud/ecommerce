import 'package:dio/dio.dart';
import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/network/api_consumer.dart';
import 'package:ecommerce/core/network/end_points.dart';
import 'package:ecommerce/core/utils/service_locator.dart';
import 'package:ecommerce/core/utils/storage_helper.dart';
import 'package:ecommerce/features/auth/data/models/login_model.dart';
import 'package:ecommerce/features/auth/data/models/profileModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/upload_image_to_api.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ApiConsumer api;
  UserCubit(this.api) : super(UserInitial());

  // Sign-in form key
  final GlobalKey<FormState> signInFormKey = GlobalKey();

  // Sign-in controllers
  final TextEditingController signInEmail = TextEditingController();
  final TextEditingController signInPassword = TextEditingController();

  // Sign-up form key
  final GlobalKey<FormState> signUpFormKey = GlobalKey();

  // Sign-up controllers
  final TextEditingController signUpName = TextEditingController();
  final TextEditingController signUpPhoneNumber = TextEditingController();
  final TextEditingController signUpEmail = TextEditingController();
  final TextEditingController signUpPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  // Profile Pic
  XFile? profilePic;


  uploadProfilePic(XFile? image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  @override
  Future<void> close() {
    // Dispose of controllers to avoid memory leaks
    signInEmail.dispose();
    signInPassword.dispose();
    signUpName.dispose();
    signUpPhoneNumber.dispose();
    signUpEmail.dispose();
    signUpPassword.dispose();
    confirmPassword.dispose();
    return super.close();
  }

  login() async {
    try {
      emit(LoginLoading());
      final response = await api.post(
        ApiEndpoints.signInEndPoint,
        data: {
          ApiKeys.email: signInEmail.text,
          ApiKeys.password: signInPassword.text,
        },
      );
      final model = LoginModel.fromJson(response);
      // final decodedToken = JwtDecoder.decode(
      //   model.token,
      // ); // فك التوكين واقدر اطلع من جواه الاي دي
      await StorageHelper().saveToken(model.token);
      //await StorageHelper().saveId(decodedToken['id']);
      emit(LoginSuccess());
    } on ServerException catch (e) {
      emit(LoginFailure(errMessage: e.errModel.errMessage));
    }
  }

  signup() async {
    try {
      emit(SignupLoading());
      final response = await api.post(
        ApiEndpoints.signUpEndPoint,
        data: {
          ApiKeys.name: signUpName.text,
          ApiKeys.email: signUpEmail.text,
          ApiKeys.password: signUpPassword.text,
          ApiKeys.profilePic: await uploadFile(image: profilePic!),
        },
      );
      emit(SignupSuccess(message: 'Done'));
    } on ServerException catch (e) {
      emit(SignupFailure(errMessage: e.errModel.errMessage));
    }
  }

  getToken()async{
    final token = await getIt.get<StorageHelper>().getToken(key: ApiKeys.token);
    return token;
  }

  Future<void> getProfile() async {
    try {
      emit(GetProfileLoading());
      final token = await getToken();
      print('Token is: $token');

      final response = await api.get(
        ApiEndpoints.getProfileEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer$token' ,
            'Content-Type': 'application/json',
          },
        ),
      );

      final model = ProfileModel.fromJson(response);
      emit(GetProfileSuccess(model: model));
    } on ServerException catch (e) {
      emit(GetProfileFailure(errMessage: e.errModel.errMessage));
    }
  }
  
  uploadFile({required XFile image})async{
   try {
     final file = await uploadImageToAPI(image: image);
     final response = await api.post(
         ApiEndpoints.uploadEndPoint,
         isFormData: true,
         data: {'file' : file}
     );
     return response['location'];

   }  catch (e) {
       print("Image upload error: $e");
       throw Exception("Image upload failed");
   }
  }

}
