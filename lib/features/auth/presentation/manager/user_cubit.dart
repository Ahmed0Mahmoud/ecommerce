import 'package:dartz/dartz.dart';

import 'package:ecommerce/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepo repo;


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

  UserCubit(this.repo) : super(UserInitial());


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
   emit(LoginLoading());
   final data = await repo.signIn(email: signInEmail.text, password: signInPassword.text);
   data.fold((failure){
     emit(LoginFailure(errMessage: failure));
   }, (model){
     emit(LoginSuccess());
   });
  }

  signup() async {
    emit(SignupLoading());

    String? profilePicUrl;

    if (profilePic != null) {
      final uploadResult = await uploadFile();
      uploadResult.fold(
            (failure) {
          emit(SignupFailure(errMessage: failure));
          return;
        },
            (imageUrl) {
          profilePicUrl = imageUrl;
        },
      );
    }

    final data = await repo.signUp(
      name: signUpName.text,
      email: signUpEmail.text,
      password: signUpPassword.text,
      profilePic: profilePicUrl!, // Pass the uploaded image URL
    );

    data.fold(
          (failure) {
        emit(SignupFailure(errMessage: failure));
      },
          (model) {
        emit(SignupSuccess(message: model));
      },
    );
  }

  Future<Either<String, String>> uploadFile() async {
    if (profilePic == null) return Left("No image selected");

    final data = await repo.uploadFile(image: profilePic!);
    return data;
  }

  getProfile()async{
    emit(GetProfileLoading());
    final data = await repo.getProfile();
    data.fold((failure){
      emit(GetProfileFailure(errMessage: failure));
    }, (model){
      emit(GetProfileSuccess(model: model));
    });
  }


}
