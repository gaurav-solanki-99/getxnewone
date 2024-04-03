import 'package:get/get.dart';
import 'package:newone/MyBindingChapter/HomeScreenController.dart';

class HomeBindig extends Bindings{
  @override
  void dependencies()
  {
    Get.lazyPut(() => HomeController());
  }


}