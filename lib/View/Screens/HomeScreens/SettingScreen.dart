import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/View/Screens/NavScreens/EditProfile.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialCubit/SocialCubit.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialCubit/SocialState.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit =BlocProvider.of<SocialCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:
            [
              Container(
                height: 180,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment:AlignmentDirectional.topCenter,
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            image:  DecorationImage(
                              image:  NetworkImage(
                                '${cubit.model!.cover}',
                              ),
                              fit: BoxFit.cover,

                            ),
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                    ),
                     CircleAvatar(
                      radius:63 ,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:NetworkImage(
                          '${cubit.model!.image}',
                        ) ,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                '${cubit.model!.name}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                '${cubit.model!.bio}',
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children:
                [
                  Expanded(
                    child: Column(
                      children:
                      [
                        Text(
                          '100',style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Posts',style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children:
                      [
                        Text(
                          '120',style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Photo',style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children:
                      [
                        Text(
                          '10k',style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Comment',style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children:
                      [
                        Text(
                          '12k',style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'likes',style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children:
                [
                  Expanded(
                    child: OutlinedButton(onPressed: (){}, child: Text(
                      'add Photo',style: Theme.of(context).textTheme.bodyText1,

                    )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  OutlinedButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                  }, child: const Icon(Icons.edit)),
                ],
              )



            ],
          ),
        );
      },
    );
  }
}
