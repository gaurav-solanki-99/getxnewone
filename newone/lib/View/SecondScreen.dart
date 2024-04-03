import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:newone/Model/ProductsModel.dart';
import 'package:newone/Model/UserModel.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {


  UserModel? model;


  @override
  void initState() {

    //model=Get.parameters["a"] as UserModel?;
    model= Get.arguments as UserModel;

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Second"),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(""+model!.name!??"",style: TextStyle(fontSize: 25),),
              Text(""+model!.email!??"",style: TextStyle(fontSize: 25),),
              Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.all(10.00),
                child: InkWell(
                    onTap: (){
                     Get.toNamed("/product");



                    },
                    child: Text("Procucts",style: TextStyle(fontSize: 25),)),
                //child: Text("Back",style: TextStyle(fontSize: 25),)),
              ),
              Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.all(10.00),
                child: InkWell(
                    onTap: (){
                     Get.toNamed("/reactive");



                    },
                    child: Text("Reactive",style: TextStyle(fontSize: 25),)),
                //child: Text("Back",style: TextStyle(fontSize: 25),)),
              ),
SizedBox(height: 10,),
              Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.all(10.00),
                child: InkWell(
                    onTap: (){
                      Get.back();

              

                    },
                    child: Text(" Back",style: TextStyle(fontSize: 25),)),
                    //child: Text("Back",style: TextStyle(fontSize: 25),)),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
