import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialapp/Controller/CacheHelper.dart';
import 'package:socialapp/View/Screens/LoginScreen/LoginCubit/LoginCubit.dart';
import 'package:socialapp/View/Screens/LoginScreen/LoginCubit/LoginState.dart';
import 'package:socialapp/View/Screens/RegisterScreen/RegisterScreen.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialLayout.dart';
import 'package:socialapp/View/Widgets/CustomButton/CustomMaterialButton.dart';
import 'package:socialapp/View/Widgets/CustomFormField/CustomTextFormField.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state)
      {
        if(state is SocialLoginErrorState){
          Fluttertoast.showToast(msg: state.error

          );
        }
        if(state is SocialLoginSuccessState){
          CacheHelper.saveData(key: 'uId',value: state.uId).then((value)
          {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SocialLayout()));
          });
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Login For better Communication',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 20),
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
                      ConditionalBuilder(
                        condition: state is! SocialLoginLoadingState,
                        builder: (context) => CustomMaterialButton(
                          text: 'Login',
                          width: double.infinity,
                          height: 50,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t Have Email',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12, color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              child: Text(
                                'Register Now',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 15, color: Colors.teal),
                              ))
                        ],
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
