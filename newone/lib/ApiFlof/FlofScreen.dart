import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newone/ApiFlof/ApiEndPoint.dart';
import 'package:newone/ApiFlof/MyNetWork.dart';
import 'package:newone/FloFGetX/ContantsUI/MyWidget.dart';
import 'package:newone/FloFGetX/Network/ApiServices.dart';
import 'package:newone/FloFGetX/Session/MyStorageClass.dart';

import 'LoginModel.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
class FloFScreen extends StatefulWidget {
  const FloFScreen({Key? key}) : super(key: key);

  @override
  State<FloFScreen> createState() => _FloFScreenState();
}

class _FloFScreenState extends State<FloFScreen> {

  File? _imageFile;
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



  Future<void> pickCameraImage(ImageSource camera) async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      setState(() {
        _imageFile = File(imageFile.path);
      });


    //  _cropImage(_imageFile!.path);
    }
  }

  _cropImage(filePath) async {
    await ImageCropper.platform
        .cropImage(
        sourcePath: filePath,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1))
        .then((value) {
          setState(() {
            _imageFile = File(value!.path);
          });

      print("Image Path>>>" + _imageFile.toString());
    });
  }

  /// Get from gallery
  _getFromGallery(ImageSource gallery) async {
    XFile? pickedFile = (await ImagePicker.platform.getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    ));

    _cropImage(pickedFile!.path);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("FLOF Apis "),),
      body: Center(
        child: Column(
          children: [
            Container(
             height: 120,
             width: 120,
              child: Column(
                children: [
              _imageFile==null?Container():
                  Image.file(
                    _imageFile!,
                    height: 120,
                    width: 120,
                  )


                ],
              ),
            ),

            SizedBox(height: 10,),
            InkWell(
                onTap: () async {

                  pickCameraImage(ImageSource.camera);
                }, child: Mywidget.mybutton("Take Photo")),
            SizedBox(height: 10,),
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
            SizedBox(height: 10,),
            InkWell(
                onTap: () async {
                  var result = await MyApiService.multipart(ApiEndPoint.updateProfilePicture,{
                  'first_name': 'Gaurav',
                  'last_name': 'solanki',
                  'display_name': 'Gaurav',
                  },_imageFile,MyApiService.getAllHeaders());

                  if(result!=null)
                  {
                    print("Api Result Login "+result!.toString());
                    print("RESULT : $result");
                  }


                }, child: Mywidget.mybutton("Edit Profile")),
          ],
        )
      ),
    );
  }
}

