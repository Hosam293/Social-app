import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialCubit/SocialCubit.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialCubit/SocialState.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<SocialCubit>(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 25),
            ),
            actions:
            [
              IconButton(onPressed: (){}, icon: Icon(Icons.notification_add_outlined)),
              IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined)),

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:
            [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.wechat),label: 'Chat'),
              BottomNavigationBarItem(icon: Icon(Icons.post_add_rounded),label: 'Post'),
              BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_sharp),label: 'Users'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavIcon(index);

            },

          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
