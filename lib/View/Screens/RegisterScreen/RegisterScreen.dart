import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/View/Screens/LoginScreen/LoginScreen.dart';
import 'package:socialapp/View/Screens/RegisterScreen/RegisterCubit/RegisterStates.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialLayout.dart';

import '../../Widgets/CustomButton/CustomMaterialButton.dart';
import '../../Widgets/CustomFormField/CustomTextFormField.dart';
import 'RegisterCubit/RegisterCubit.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is SocialCreateSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SocialLayout()));
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Sign up For better Communication',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 15,
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
                        type: TextInputType.text,
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
                        height: 15,
                      ),
                      CustomFormField(
                        title: 'Email Address',
                        titleController: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Account Correctly';
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        prefixIcon: const Icon(Icons.email_outlined),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomFormField(
                        title: 'Password',
                        titleController: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Account Correctly';
                          }
                          return null;
                        },
                        type: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                            icon: cubit.fabIcon,
                            onPressed: () {
                              cubit.changeFabIcon();
                            }),
                        obscureText: cubit.obscure,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
                      ),
                      const SizedBox(
                        height: 15,
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
                      const SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                          condition: state is! SocialRegisterLoadingState,
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                          builder: (context) => CustomMaterialButton(
                                text: 'Sign up',
                                width: double.infinity,
                                height: 50,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userRegister(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        phone: phoneController.text);
                                  }
                                },
                              )),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'Login now',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15, color: Colors.teal),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
