import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Model/UserModel.dart';
import 'package:socialapp/View/Screens/RegisterScreen/RegisterCubit/RegisterStates.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  bool obscure = true;
  Widget fabIcon = Icon(Icons.visibility);

  void changeFabIcon() {
    obscure = !obscure;
    (obscure)
        ? fabIcon = Icon(Icons.visibility)
        : fabIcon = Icon(Icons.visibility_off);
    emit(ChangeFabIconState());
  }

  userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('$value sgin in success');
      userCreate(
          uId: value.user!.uid,
          phone: value.user!.phoneNumber,
          name: value.user!.displayName,
          email: value.user!.email);
    }).catchError((error) {
      print('${error.toString()} there is error in create');
      emit(SocialRegisterErrorState());
    });
  }

  userCreate(
      {required dynamic email,
      required String uId,
      required dynamic name,
      required dynamic phone}) {
    emit(SocialCreateLoadingState());
    UserModel model = UserModel(
      email: email,
      name: name,
      phone: phone,
      uId: uId,
      bio: 'bio',
      image:
          'https://as2.ftcdn.net/v2/jpg/02/80/14/97/1000_F_280149761_lRNVPQFBh8f3n6yaptGB0jCyeZd56ZTi.jpg',
      cover:
          'https://as2.ftcdn.net/v2/jpg/02/80/14/97/1000_F_280149761_lRNVPQFBh8f3n6yaptGB0jCyeZd56ZTi.jpg',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      print('value data created');
      emit(SocialCreateSuccessState());
    }).catchError((error) {
      print('${error.toString()} there is error in regi');

      emit(SocialCreateErrorState());
    });
  }
}
