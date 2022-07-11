import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialCubit/SocialCubit.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialCubit/SocialState.dart';
import 'package:socialapp/View/Widgets/CustomButton/CustomMaterialButton.dart';
import 'package:socialapp/View/Widgets/CustomFormField/CustomTextFormField.dart';

class EditProfile extends StatelessWidget {
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state)
      {

        var cubit =BlocProvider.of<SocialCubit>(context);
        var coverImage =BlocProvider.of<SocialCubit>(context).coverImage;
        var profileImage =BlocProvider.of<SocialCubit>(context).profileImage;
        nameController.text=cubit.model!.name!;
        phoneController.text=cubit.model!.phone!;
        bioController.text=cubit.model!.bio!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined,color: Colors.black,),
            ),
            title: Text(
              'Edit Profile',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            titleSpacing: 5.0,
            actions: [
              TextButton(
                  onPressed: ()
                  {
                    cubit.updateUserData(name: nameController.text, phone: phoneController.text, bio: bioController.text);
                  },
                  child: Text(
                    'Update',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.blue),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is UpdateUserDataLoadingState)
                    SizedBox(height: 5,),
                  if(state is UpdateUserDataLoadingState)
                    LinearProgressIndicator(),

                  Container(
                    height: 180,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 120,
                                width: double.infinity,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:coverImage == null ? NetworkImage(
                                        '${cubit.model!.cover}'
                                      ):FileImage(coverImage)  as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                              IconButton(
                                  onPressed: ()
                                  {
                                    cubit.getCoverImage();
                                  },
                                  icon: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.blue,
                                      child: Icon(Icons.linked_camera_outlined)))
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 63,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: profileImage == null ? NetworkImage(
                                    '${cubit.model!.image}'
                                ):FileImage(profileImage)  as ImageProvider,
                              ),
                            ),
                            IconButton(
                                onPressed: ()
                                {
                                  cubit.getProfileImage();

                                },
                                icon: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.blue,
                                    child: Icon(Icons.linked_camera_outlined)))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomMaterialButton(text: 'updae',onPressed: ()
                  {
                    cubit.updateProfileImage(name: nameController.text, phone: phoneController.text,  bio: bioController.text);
                    cubit.updateCoverImage(name: nameController.text, phone: phoneController.text,  bio: bioController.text);
                  },),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomFormField(
                    title: 'name',
                    titleController: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Account Correctly';
                      }
                      return null;
                    },
                    type: TextInputType.name,
                    // suffixIcon: IconButton
                    //   (icon: cubit.fabIcon,onPressed: ()
                    // {
                    //   cubit.changeFabIcon();
                    // }),
                    // obscureText: cubit.obscure,
                    prefixIcon: const Icon(
                        Icons.drive_file_rename_outline_outlined),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    title: 'bio',
                    titleController: bioController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Account Correctly';
                      }
                      return null;
                    },
                    type: TextInputType.text,
                    // suffixIcon: IconButton
                    //   (icon: cubit.fabIcon,onPressed: ()
                    // {
                    //   cubit.changeFabIcon();
                    // }),
                    // obscureText: cubit.obscure,
                    prefixIcon: const Icon(
                        Icons.biotech_outlined),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormField(
                    title: 'Phone',
                    titleController: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Account Correctly';
                      }
                      return null;
                    },
                    type: TextInputType.text,
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
