import 'package:get/get.dart';
import 'package:newone/FloFGetX/Modules/SplashModule/SplashController.dart';

class SplashBinding extends Bindings
{
  @override
  void dependencies() {

    Get.lazyPut(() => SplashController(),fenix: true);
  }

}