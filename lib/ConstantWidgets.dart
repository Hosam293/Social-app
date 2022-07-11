import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget verify =SafeArea(
  child: Scaffold(
    body: ConditionalBuilder(
      condition: (!FirebaseAuth.instance.currentUser!.emailVerified),
      builder: (context)=>Column(
        children: [
          SizedBox(
            height: 10,
          ),
          if(!FirebaseAuth.instance.currentUser!.emailVerified)
            Container(
              decoration: BoxDecoration(
                  color: Colors.amberAccent.withOpacity(.5),
                  borderRadius: BorderRadius.circular(25)

              ),
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.warning_amber_outlined,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Please Verfiy your Account',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: ()
                    {
                      FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value)
                      {
                        Fluttertoast.showToast(msg: 'check your mail');
                      });
                    },
                    child: Text(
                      'Send',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black, fontSize: 15),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
      fallback: (context)=>Center(child: const CircularProgressIndicator()),
    ),
  ),
);