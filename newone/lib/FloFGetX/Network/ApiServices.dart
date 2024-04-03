import 'package:get/get.dart';
import 'package:newone/FloFGetX/Modules/ProfileModule/UserDataModel.dart';

class BaseApiService extends GetConnect{


  @override
  void onInit(){
    super.onInit();
    baseUrl = "https://reqres.in/api";
  }
}

class ApiService extends BaseApiService {
  Future<UserData?> fetchData() async {


      final Response<UserData> response = await get<UserData>(
        'https://reqres.in/api/users?page=2',

        decoder: (data) {
          print("DataGGGGG $data");
          return UserData.fromJson(data);
        },
      );

    return response.body;
  }








}