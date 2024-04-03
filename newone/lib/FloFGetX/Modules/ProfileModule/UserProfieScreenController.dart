import 'package:get/get.dart';
import 'package:newone/FloFGetX/Modules/ProfileModule/UserDataModel.dart';
import 'package:newone/FloFGetX/Network/ApiServices.dart';

class UserProfileScreenController extends  GetxController{

 // var userList=[].obs;
  RxList<UserModel> userList = <UserModel>[].obs;





  getData() async {

      await ApiService().fetchData().then((value) {

      //  userList = value!.data as RxList;

        userList.assignAll(value!.data);
       // userList.refresh();

        print("DataGGG $value");
        print("DataGGG $userList");
        update();
      });


  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

}