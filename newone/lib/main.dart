import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newone/FloFGetX/Modules/ProfileModule/UserProfileScreen.dart';
import 'package:newone/FloFGetX/Modules/SplashModule/SplashBinding.dart';
import 'package:newone/FloFGetX/Modules/SplashModule/SplashScreen.dart';
import 'package:newone/FloFGetX/Session/MyStorageClass.dart';
import 'package:newone/MyBindingChapter/HomeBinding.dart';
import 'package:newone/MyBindingChapter/HomeScreen.dart';
import 'package:newone/MyBindingChapter/ProfileBinding.dart';
import 'package:newone/MyBindingChapter/ProfileScreen.dart';
import 'package:newone/StateManagement/ReactiveStateMangement/firstreative.dart';
import 'package:newone/View/ProductScreen.dart';

import 'ApiFlof/FlofScreen.dart';
import 'FloFGetX/Modules/ProfileModule/UserProfileScreenBinding.dart';
import 'ML/HomeMLScreen.dart';
import 'ML/WelocomeMl.dart';
import 'View/FirstScreen.dart';
import 'View/SecondScreen.dart';

Future<void> main() async {
 Get.put(MyStroageClass());

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: "WelcomeMLScreen",
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      getPages: [
        GetPage(name: "/first", page: ()=>FirstScreen()),
        GetPage(name: "/second", page: ()=>SecondScreen()),
        GetPage(name: "/product", page: ()=>ProductScreen()),
        GetPage(name: "/reactive", page: ()=>FirstReactive()),
        GetPage(name: "/home", page: ()=>HomeScreen(),binding: HomeBindig()),
        GetPage(name: "/profile", page: ()=>ProfileScreen(),binding:ProfileBinding() ),
        GetPage(name: "/splash", page: ()=>SplashScreen(),binding:SplashBinding() ),
        GetPage(name: "/userprofile", page: ()=>UserProfileScreeen(),binding: UserProfileScreenBinding()),
        GetPage(name: "/FloFScreen", page: ()=>FloFScreen(),),
        GetPage(name: "/HomeMLScreen", page: ()=>HomeMLScreen(),),
        GetPage(name: "/WelcomeMLScreen", page: ()=>WelcomeMLScreen(),),
      ],

     unknownRoute: GetPage(name: "/unknown",page: ()=>FirstScreen()),
     // home: FirstScreen(),
    );
  }
}


