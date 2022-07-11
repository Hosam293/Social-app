import 'package:flutter/material.dart';

class NewFeeds extends StatelessWidget {
  const NewFeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                const Card(
                  elevation: 5.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: NetworkImage(
                      'https://img.freepik.com/premium-photo/happy-manager-man-show-okay-ring-gesture-making-ok-sign-working-laptop-outdoor-cafe_474717-61375.jpg?w=740',
                    ),
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Communicate With Friends',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              elevation: 5.0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: const NetworkImage(
                            'https://img.freepik.com/premium-photo/happy-manager-man-show-okay-ring-gesture-making-ok-sign-working-laptop-outdoor-cafe_474717-61375.jpg?w=740',
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Hosam Jamal',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(height: 1.1),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  const Icon(
                                    Icons.verified_outlined,
                                    color: Colors.blue,
                                    size: 18,
                                  )
                                ],
                              ),
                              Text(
                                'January 21, 2021 at 11:00 pm',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(height: 1.4),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.workspaces_outline,
                              color: Colors.black,
                            ))
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black, fontSize: 14),
                    ),
                    Wrap(
                      children: [
                        Container(
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text('#hashtag',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
                            ),
                            padding: EdgeInsets.zero,
                            minWidth: 1.0,
                          ),
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text('#hashtag',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
                            ),
                            padding: EdgeInsets.zero,
                            minWidth: 1.0,
                          ),
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text('#hashtag',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
                            ),
                            padding: EdgeInsets.zero,
                            minWidth: 1.0,
                          ),
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text('#hashtag',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
                            ),
                            padding: EdgeInsets.zero,
                            minWidth: 1.0,
                          ),
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text('#hashtag',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
                            ),
                            padding: EdgeInsets.zero,
                            minWidth: 1.0,
                          ),
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text('#hashtag',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
                            ),
                            padding: EdgeInsets.zero,
                            minWidth: 1.0,
                          ),
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text('#hashtag',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
                            ),
                            padding: EdgeInsets.zero,
                            minWidth: 1.0,
                          ),
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsetsDirectional.only(end: 5.0),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text('#hashtag',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blue),
                            ),
                            padding: EdgeInsets.zero,
                            minWidth: 1.0,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 120,
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: const NetworkImage(
                            'https://img.freepik.com/premium-photo/happy-manager-man-show-okay-ring-gesture-making-ok-sign-working-laptop-outdoor-cafe_474717-61375.jpg?w=740',
                          ),
                          fit: BoxFit.cover,

                        ),
                        borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children:
                        [
                          Expanded(
                            child: InkWell(
                              onTap: (){},
                              child: Row(
                                children:
                                [
                                  const Icon(Icons.heart_broken_outlined,color: Colors.redAccent,),
                                  Text(
                                    '120',
                                    style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:
                                [
                                  const Icon(Icons.wechat_outlined,color: Colors.amberAccent,),
                                  Text(
                                    '120 comment',
                                    style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: const NetworkImage(
                            'https://img.freepik.com/premium-photo/happy-manager-man-show-okay-ring-gesture-making-ok-sign-working-laptop-outdoor-cafe_474717-61375.jpg?w=740',
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                'Write a comment',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(height: 1.1,color: Colors.grey),
                              ),


                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Row(
                            children:
                            [
                              const Icon(Icons.heart_broken_outlined,color: Colors.redAccent,),
                              Text(
                                '120',
                                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
