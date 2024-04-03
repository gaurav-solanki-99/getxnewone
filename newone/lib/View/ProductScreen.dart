import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newone/Controller/ProductController.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final controller = Get.put(ProductController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),

      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(

                    onPressed: () {

                      Get.find<ProductController>().rxProducts.clear();
                      Get.find<ProductController>().update();
                    },
                    child: Text("Clear"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.find<ProductController>().getAllProduct();

                    },
                    child: Text("Reload"),
                  )
                ],
              ),
              Expanded(
                child: GetX<ProductController>(
                  init: ProductController(),
                  builder: (controller) {
                    if (controller.rxProducts.toList().isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 5,
                        children:
                        List.generate(controller.rxProducts.toList().length, (index) {
                          return InkWell(
                            onTap: (){
                              controller.select(index);
                              controller.rxProducts.refresh();
                              controller.update();

                              print(">>>>>>selected"+controller.rxProducts.toList()[index].selected.toString());
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color:controller.rxProducts.toList()[index].selected==true?Colors.green:Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(
                                          2.0, 2.0), // shadow direction: bottom right
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    child: Expanded(
                                      child: Image.network(
                                        controller.rxProducts.toList()[index].thumbnail,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    controller.rxProducts.toList()[index].title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
