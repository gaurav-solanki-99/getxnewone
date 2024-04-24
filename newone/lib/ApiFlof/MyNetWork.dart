import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:newone/FloFGetX/Session/MyStorageClass.dart';

import 'ApiEndPoint.dart';
class MyApiService extends GetxService{



 static var BASEURL = "https://api.flof.ca/v1";


  @override
  void onInit() {
    super.onInit();
  }


  static getDefaultHeader()
  {
    Map<String, String> defaultHeaders =  {

      "device-token": MyStroageClass.getData("device-token"),
      "device-type": MyStroageClass.getData("device-type"),
      "device-id": MyStroageClass.getData("device-id"),
      "api-key": "5apd476956dsfhgha23646984asdfasd",
      "accept": "application/json"
    };

    return defaultHeaders;
  }


  static getAllHeaders()
  {
    Map<String, String> defaultHeaders =  {
      "access-token":  MyStroageClass.getData("TOKEN"),
      "device-token": MyStroageClass.getData("device-token"),
      "device-type": MyStroageClass.getData("device-type"),
      "device-id": MyStroageClass.getData("device-id"),
      "api-key": "5apd476956dsfhgha23646984asdfasd",
      "accept": "application/json"


    };

    return defaultHeaders;
  }





  static Future<http.Response?> postApi(String endpoint,Map<String, String>? formData,var  headers)  async {

    print("Headers "+getDefaultHeader().toString());
    try {
      final response = await http.post(
        Uri.parse(MyApiService.BASEURL + endpoint),
        body: formData,
        headers: headers,
      );



      if (response.statusCode == 200) {
        print("Success Api Call "+response.body);



        return response;
      } else {
        print("Else Login" + response.body);
        final responseBody = response.body;
        // print(responseData);


        return null;
      }
    } catch (e) {
      print("EXCECPTION"+e.toString());
      return null;
    }
  }
  static Future<String?> multipart(String endpoint,Map<String, String>? formData,File? file,var  headers)  async {

    print("Headers "+getDefaultHeader().toString());
    try {
      // final response = await http.post(
      //   Uri.parse(MyApiService.BASEURL + endpoint),
      //   body: formData,
      //   headers: headers,
      // );

      final request = http.MultipartRequest('POST', Uri.parse(MyApiService.BASEURL + endpoint));

      request.headers.addAll(headers);

      request.fields.addAll(formData!);

      // Add the file using MultipartFile.fromPath



      print("File>>"+file.toString());
      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'profile_img', file!.path.toString()));
      }


      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();

        print("Success Api Call "+responseBody.toString());



        return responseBody.toString();
      } else {
        // print("Else Login" + response.body);
        // final responseBody = response.body;
        // print(responseData);


        return null;
      }
    } catch (e) {
      print("EXCECPTION"+e.toString());
      return null;
    }
  }
  static Future<http.Response?> get(String endpoint ,var  headers)  async {

    print("Headers "+getDefaultHeader().toString());
    try {
      final response = await http.get(
        Uri.parse(MyApiService.BASEURL + endpoint),
        headers: headers,
      );



      if (response.statusCode == 200) {
        print("Success Api Call "+response.body);



        return response;
      } else {
        print("Else Login" + response.body);
        final responseBody = response.body;
        // print(responseData);


        return null;
      }
    } catch (e) {
      print("EXCECPTION"+e.toString());
      return null;
    }
  }


}

