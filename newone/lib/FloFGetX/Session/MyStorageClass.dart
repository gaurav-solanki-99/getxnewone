import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyStroageClass extends GetxService{

   static GetStorage box = GetStorage();


  @override
  Future<void> onInit() async {
   GetStorage.init();
    super.onInit();
  }

  static setData(String key,value){
    box.write(key, value);
  }

  static getData(String key)
  {
     return box.read(key);
  }


 static CleanStorage()
  {
    box.erase();
  }




}