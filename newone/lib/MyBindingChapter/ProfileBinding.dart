import 'package:get/get.dart';

import 'ProfileScreenController.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => ProfileScreenController());


  }

}