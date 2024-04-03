import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newone/MyBindingChapter/ProfileScreenController.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.find<ProfileScreenController>();


  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     //   title: Text(Get.find<ProfileScreenController>().pageName),
        title: Text(controller.pageName),



      ),
    );
  }
}
