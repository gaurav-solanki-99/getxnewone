import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:newone/FloFGetX/Modules/SplashModule/SplashController.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
          () {


        Get.offAllNamed('/userprofile');
      },
    );
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (controller) {
          return Stack(

            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child:Center(child: Text("Flutter",style: TextStyle(fontSize:controller.animation!.value * 50 ),)),
                    // width: controller.animation!.value * 200,
                    // height: controller.animation!.value * 200,
                  ),

                  Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(90)),




                  ),
                  child: Card(

                    color: Colors.black,
                    elevation: 10,


                  ),
                    height: 10,
                    width: controller.animation!.value * 100,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}