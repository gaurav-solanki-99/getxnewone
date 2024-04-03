import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newone/FloFGetX/ContantsUI/MyWidget.dart';
class WelcomeMLScreen extends StatefulWidget {
   WelcomeMLScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeMLScreen> createState() => _WelcomeMLScreenState();
}

class _WelcomeMLScreenState extends State<WelcomeMLScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Machine Learning"),
      ),

      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap:()=>Get.toNamed('/HomeMLScreen'),
              child:  Mywidget.mybutton("Image Recognization"),
            )



          ],

        ),
      ),
    );
  }
}
