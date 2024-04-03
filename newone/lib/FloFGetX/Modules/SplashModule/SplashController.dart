import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController  with GetSingleTickerProviderStateMixin
{
   AnimationController? animationController;
   Animation<double>? animation;
   var x=0.obs;
   var isLogin= true.obs;

  @override
  void onInit() {
    animationInitilization();
    x++;
    update();
    debounce(x, (callback) => {

      print("Splash Navigation")

    },time: Duration(seconds: 5));

    super.onInit();
  }

  animationInitilization() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut)
            .obs
            .value;
    animation!.addListener(() => update());
    animationController!.forward();

  }

   @override
   dispose() {
     animationController!.dispose(); // you need this
     super.dispose();
   }

}