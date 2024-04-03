import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:newone/FloFGetX/Modules/ProfileModule/UserProfieScreenController.dart';

class UserProfileScreenBinding extends Bindings
{
  @override
  void dependencies() {

    Get.lazyPut(() => UserProfileScreenController(),fenix: true);
  }

}