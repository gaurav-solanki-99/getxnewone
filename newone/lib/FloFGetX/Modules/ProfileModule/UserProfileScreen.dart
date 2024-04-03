import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newone/FloFGetX/Modules/ProfileModule/UserProfieScreenController.dart';

class UserProfileScreeen extends StatefulWidget {
  @override
  _UserProfileScreeenState createState() => _UserProfileScreeenState();
}

class _UserProfileScreeenState extends State<UserProfileScreeen> {





  var list = [
    'https://reqres.in/img/faces/9-image.jpg',
    'https://reqres.in/img/faces/9-image.jpg',
    'https://reqres.in/img/faces/9-image.jpg',
    'https://reqres.in/img/faces/9-image.jpg',
    'https://reqres.in/img/faces/9-image.jpg',
    'https://reqres.in/img/faces/9-image.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile Screen"),
      ),
      body: GetBuilder<UserProfileScreenController>(
        builder: (controller) {

          print("Gaurav "+jsonEncode(controller.userList.toList()));
          return GridView.builder(
              itemCount:  controller.userList.toList().length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5 / 0.6,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (_, index) {

                return InkWell(
                  onTap: () {

                  },
                  child: Container(


                    child: Stack(
                      children: [
                        // Food Image

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color:
                              Colors.black12, // Set your desired border color
                              width:
                              1.0, // Set your desired border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              child: Image.network(
                              controller.userList.toList()[index].avatar,
                                width: width/2,
                                height:250,
                                fit: BoxFit.cover,

                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width/2,
                          height:250,
                decoration: new BoxDecoration(
                gradient: new LinearGradient(
                colors: [Colors.transparent,Colors.black],
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
                stops: [0.0, 1.0],
                tileMode: TileMode.mirror)),
                ),



                        // Food Name and Restaurant
                        // Container(
                        //   padding: EdgeInsets.all(10),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       Text(
                        //         food.name,
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontFamily: fc_SemiBold,
                        //           fontSize: 11,
                        //         ),
                        //       ),
                        //       Text(
                        //         food.categoryName,
                        //         style: TextStyle(
                        //           color: sh_red,
                        //           fontFamily: fc_Regular,
                        //           fontSize: 8,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              });
        }
      ),
    );
  }
}