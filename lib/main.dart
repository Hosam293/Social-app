import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/Constants.dart';
import 'package:socialapp/Controller/DioHelper.dart';
import 'package:socialapp/View/Screens/LoginScreen/LoginCubit/LoginCubit.dart';
import 'package:socialapp/View/Screens/LoginScreen/LoginScreen.dart';
import 'package:socialapp/View/Screens/RegisterScreen/RegisterCubit/RegisterCubit.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialCubit/SocialCubit.dart';
import 'package:socialapp/View/Screens/SocialLayout/SocialLayout.dart';

import 'Controller/CacheHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  DioHelper.init();
  uId = CacheHelper.getData(key: 'uId');
  print('$uId this is hjkh k');
  Widget? widget;
  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = LoginScreen();
  }

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LoginCubit()),
    BlocProvider(create: (context) => RegisterCubit()),
    BlocProvider(create: (context) => SocialCubit()..getUserData()),
  ], child: MyApp(widget)));
}
class MyApp extends StatelessWidget {
  Widget? startScreen;

  MyApp(this.startScreen); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocialApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
            bodyText1: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.teal,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light),
          backwardsCompatibility: true,
          actionsIconTheme: IconThemeData(color: Colors.black, size: 25),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          // selectedIconTheme: IconThemeData(
          //   color: Colors.teal
          // ),
          // unselectedIconTheme: IconThemeData(
          //     color: Colors.amberAccent
          // ),
          unselectedItemColor: Colors.amberAccent,
          selectedItemColor: Colors.teal
        ),
      ),
      home: startScreen,
    );
  }
}
