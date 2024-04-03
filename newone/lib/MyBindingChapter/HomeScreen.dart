import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.all(10.00),
          child: InkWell(
              onTap: () {
                // Get.to(()=>SecondScreen(),arguments: UserModel("Gaurav","gaurav@gmail.com"));
                // Get.to(()=>SecondScreen(),arguments: UserModel("Gaurav","gaurav@gmail.com"));
                //  Get.to(()=>ProductScreen());
                //  var user=UserModel("Gaurav","gaurav@gmail.com");
                //   Get.toNamed('/second',arguments: user);
                Get.toNamed('/profile',);
              },
              child: Text("Profile", style: TextStyle(fontSize: 25),)),
        ),
      ),
    );
  }
}
