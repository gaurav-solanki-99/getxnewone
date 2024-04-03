import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
class HomeMLScreen extends StatefulWidget {
  const HomeMLScreen({Key? key}) : super(key: key);

  @override
  State<HomeMLScreen> createState() => _HomeMLScreenState();
}

class _HomeMLScreenState extends State<HomeMLScreen> {

  Future<File>? imageFile;
  File? _image;
  String result="";
  ImagePicker? imagePicker;

  selectPhotoFromGallery() async{
    XFile? pickedFile = await imagePicker!.pickImage(source: ImageSource.gallery);
    _image=File(pickedFile!.path);
    setState(() {
      _image;
      doImageClassification();
    });

  }
  capturePhotoFromCamera() async{
    XFile? pickedFile = await imagePicker!.pickImage(source: ImageSource.camera);
    _image=File(pickedFile!.path);
    setState(() {
      _image;
      doImageClassification();

    });
  }


  loadDataModelFiles() async {
    String? output = await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
        numThreads:1,
        isAsset:true,
        useGpuDelegate:false,);
    print(output);

  }

  @override
  void initState() {
    super.initState();
    imagePicker=ImagePicker();
    loadDataModelFiles();
  }

  doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
        path: _image!.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2, //2 result per image - prediction
      threshold: 0.1,
      asynch: true,

    );

    print(recognitions!.length.toString());
    setState(() {
      result='';
    });

    recognitions.forEach((element) {
      setState(() {
        print("Result >>>> "+element.toString());
        result=element['label']+'\n\n';
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image:AssetImage('assets/backgroung.jpeg'),
          fit: BoxFit.cover,
          )
        ),

        child: Column(
          children: [
            SizedBox(width: 100,),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: TextButton(
                      onPressed: selectPhotoFromGallery,
                      onLongPress: capturePhotoFromCamera,
                      child: Container(
                        margin: EdgeInsets.only(top: 30.0,right: 35.0,left: 18.0),
                        child: _image!=null?
                        Image.file(_image!,
                          height: 360.0,
                          width: 400.0,
                          fit: BoxFit.cover,



                        ):
                            Container(
                              width: 40.0,
                              height: 190.0,
                              child: Icon(Icons.camera,
                              color: Colors.black,),
                            )

                      ),
                    ),
                  )

                ],
              ),
            ),
            SizedBox(height: 160.0,),
            Container(
              margin: EdgeInsets.only(top: 20.0,),
              child: Text('$result',
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.pinkAccent,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
