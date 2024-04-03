import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:newone/View/ProductScreen.dart';
import 'package:newone/View/SecondScreen.dart';

import '../Model/UserModel.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.all(10.00),
          child: InkWell(
              onTap: (){

                // Get.to(()=>SecondScreen(),arguments: UserModel("Gaurav","gaurav@gmail.com"));
                // Get.to(()=>SecondScreen(),arguments: UserModel("Gaurav","gaurav@gmail.com"));
              //  Get.to(()=>ProductScreen());
                var user=UserModel("Gaurav","gaurav@gmail.com");
             //   Get.toNamed('/second',arguments: user);
                Get.offNamed('/second',arguments: user);
              },
              child: Text("Next",style: TextStyle(fontSize: 25),)),
        ),
      ),
    );
  }
}
