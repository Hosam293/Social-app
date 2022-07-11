import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Model/UserModel.dart';
import 'package:socialapp/View/Screens/LoginScreen/LoginCubit/LoginState.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  bool obscure = true;
  Widget fabIcon = const Icon(Icons.visibility);

  void changeFabIcon() {
    obscure = !obscure;
    (obscure)
        ? fabIcon = const Icon(Icons.visibility)
        : fabIcon = const Icon(Icons.visibility_off);
    emit(ChangeFabIconState());
  }
  userLogin({required String email, required String password}) {

    emit(SocialLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value)
    {
      print('$value sgin in success');
      emit(SocialLoginSuccessState(value.user!.uid));
    })
        .catchError((error)
    {
      print('${error.toString()} there is error in login');
      emit(SocialLoginErrorState(error.toString()));

    });
  }
}
