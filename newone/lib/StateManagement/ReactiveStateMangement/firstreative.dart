import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FirstReactive extends StatefulWidget {
  const FirstReactive({Key? key}) : super(key: key);

  @override
  State<FirstReactive> createState() => _FirstReactiveState();
}

class _FirstReactiveState extends State<FirstReactive> {

   var count=0.obs;
   //Movie movie = Movie(RxString("Gaurav"),RxString("25"));
   var movie = Movie(name: 'Gauravs', age: '25').obs;

  //var count=Rx<int>(0);
   //RxInt(0)
  // var count=0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reactive Management"),),

      body:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Obx(() {
                return Text("$count", style: TextStyle(fontSize: 20),);
              }
            ),


            InkWell(
                onTap: (){
                  count++;
                },
                child: Text("Increment")),


            Obx(() {
              //  return Text(movie.name.value, style: TextStyle(fontSize: 20),);
              return Text(movie.value.name!, style: TextStyle(fontSize: 20),);
            }
            ),

            ElevatedButton(onPressed: (){

             // movie.name.value="Vivek";
              movie.value.name="Vivek";
              movie.refresh();
            }, child:Text("Update Vaule") )

          ],

        ),
      ),
    );
  }
}

// class Movie{
//
//   var name="".obs;
//   var age="".obs;
//
//   Movie(this.name, this.age);
// }


class Movie {

  String? name;
  String? age;

  Movie({required this.name, required this.age});
  }