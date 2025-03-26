import 'package:ecommerce/core/errors/exceptions.dart';
import 'package:ecommerce/core/network/api_consumer.dart';
import 'package:ecommerce/core/network/end_points.dart';
import 'package:ecommerce/core/utils/storage_helper.dart';
import 'package:ecommerce/features/auth/data/models/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'auth_state.dart';

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
          ApiKeys.profilePic: "https://api.lorem.space/image/face?w=640&h=480",
        },
      );
      emit(SignupSuccess(message: 'Done'));
    } on ServerException catch (e) {
      emit(SignupFailure(errMessage: e.errModel.errMessage));
    }
  }
}
