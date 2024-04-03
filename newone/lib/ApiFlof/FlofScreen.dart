import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newone/ApiFlof/ApiEndPoint.dart';
import 'package:newone/ApiFlof/MyNetWork.dart';
import 'package:newone/FloFGetX/ContantsUI/MyWidget.dart';
import 'package:newone/FloFGetX/Network/ApiServices.dart';
import 'package:newone/FloFGetX/Session/MyStorageClass.dart';

import 'LoginModel.dart';

class FloFScreen extends StatefulWidget {
  const FloFScreen({Key? key}) : super(key: key);

  @override
  State<FloFScreen> createState() => _FloFScreenState();
}

class _FloFScreenState extends State<FloFScreen> {


  @override
  void initState() {
    // TODO: implement initState
    saveData();
    super.initState();
  }

  saveData(){
    //"device-token": "1123",
    //     "device-type": "1",
    //     "device-id": "212121",
    //     "api-key": "5apd476956dsfhgha23646984asdfasd",
    //     "accept": "application/json"
    MyStroageClass.setData("device-token", "1123");
    MyStroageClass.setData("device-id", "212121");
    MyStroageClass.setData("device-type", "1");
    MyStroageClass.setData("api-key", "5apd476956dsfhgha23646984asdfasd");
    MyStroageClass.setData("accept", "application/json");
    MyStroageClass.setData("token", "");

    print("GGGGG"+MyStroageClass.getData("device-token"));


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("FLOF Apis "),),
      body: Center(
        child: Column(
          children: [
            InkWell(
            onTap: () async {
              
              var result = await MyApiService.postApi(ApiEndPoint.Login, {"email": "dfoodie@gmail.com", "password": "Qwerty@123", "user_role": "1"},MyApiService.getDefaultHeader());
              print("Api Result Login "+result!.body.toString());
              if(result!=null)
                {
                  MyStroageClass.setData("IS_LOGIN", true);
                  String token =loginModelFromJson(result.body).data.token;
                  print("IS_LOGIN "+MyStroageClass.getData("IS_LOGIN").toString());

                  print("Token "+token);
                  MyStroageClass.setData("TOKEN", token);
                  print("TOKEN "+MyStroageClass.getData("TOKEN").toString());
                }

            }, child: Mywidget.mybutton("Login")),

            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                MyStroageClass.CleanStorage();
                print("IS_LOGIN "+MyStroageClass.getData("IS_LOGIN").toString());
              },
              child: Mywidget.mybutton("Logout"),
            ),
            SizedBox(height: 10,),
            InkWell(
                onTap: () async {

                  var result = await MyApiService.get(ApiEndPoint.userOrderList+"?order_type=check status&search=",MyApiService.getAllHeaders());

                  if(result!=null)
                  {
                    print("Api Result Login "+result!.body.toString());
                    print("RESULT : $result");
                  }

                }, child: Mywidget.mybutton("GET Orders")),
            SizedBox(height: 10,),
            InkWell(
                onTap: () async {

                  var result = await MyApiService.get(ApiEndPoint.getProfile+ "?chef_id=",MyApiService.getAllHeaders());

                  if(result!=null)
                  {
                    print("Api Result Login "+result!.body.toString());
                    print("RESULT : $result");
                  }

                }, child: Mywidget.mybutton("Get Profile")),
          ],
        )
      ),
    );
  }
}

