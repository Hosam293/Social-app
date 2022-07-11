import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/Constants.dart';
import 'package:socialapp/Model/UserModel.dart';
import 'package:socialapp/View/Screens/HomeScreens/ChatScreen.dart';
import 'package:socialapp/View/Screens/HomeScreens/NewFeeds.dart';
import 'package:socialapp/View/Screens/HomeScreens/Posts.dart';
import 'package:socialapp/View/Screens/HomeScreens/SettingScreen.dart';
import 'package:socialapp/View/Screens/HomeScreens/Users.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialCubit/SocialState.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of<SocialCubit>(context);
  UserModel? model;

  getUserData() {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());

      model = UserModel.fromJson(value.data());
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataErrorState());
    });
  }

  List<Widget> screens = [
    NewFeeds(),
    ChatScreen(),
    Posts(),
    Users(),
    SettingScreen(),
  ];
  List<String> titles = ['New Feeds', 'Chat', 'Posts', 'Users', 'Settings'];
  int currentIndex = 0;

  changeBottomNavIcon(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(ChangeBottomNavIcon());
    }
  }

   File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('no');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('no');
      emit(SocialCoverImagePickedErrorState());
    }
  }

  updateProfileImage({
    required String name,
    required String phone,
    required String bio,

  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last
    }')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(name: name, phone: phone, bio: bio,image: value);

      }).catchError((error)
      {
        print('image error${error.toString()}');

      });
    })
        .catchError((error)
    {
      print('image two error${error.toString()}');

    });
  }

  updateCoverImage({
    required String name,
    required String phone,
    required String bio,

  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(coverImage!.path)
        .pathSegments
        .last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(name: name, phone: phone, bio: bio,cover: value);


      }).catchError((error)
      {
        print('cover error${error.toString()}');
      });
    })
        .catchError((error)
    {
      print('cover errortwo${error.toString()}');

    });
  }

  updateUserData({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    emit(UpdateUserDataLoadingState());
    UserModel modelUser = UserModel(
        name: name,
        bio: bio,
        cover: cover ?? model!.cover,
        image: image ?? model!.image,
        email: model!.email,
        phone: model!.phone,
        uId: uId
    );

    FirebaseFirestore.instance.collection('users').doc(uId).update(
        modelUser.toMap()).then((value)
    {
      getUserData();
    }).catchError((error)
    {
      print('update user error${error.toString()}');

      emit(UpdateUserDataErrorState());
    });
  }
}
