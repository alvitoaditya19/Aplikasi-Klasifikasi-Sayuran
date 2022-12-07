import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:tflite_image_classification/widgets/image_vege.dart';
import '../../shared/theme.dart';

class TfliteModel extends StatefulWidget {
  TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;
  late List _results;
  bool imageSelect = false;
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    top: 30,
                    bottom: 30),
                child: Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\nKelompok 5',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Jenis sayuran apa ini?',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                      'assets/images/img-profile.png',
                    ))),
                  ),
                ])),
            (imageSelect)
                ? Container(
                    margin: EdgeInsets.only(
                        left: defaultMargin, right: defaultMargin, bottom: 30),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.0),
                      child: Image.file(_image),
                    ))
                : Container(
                    margin: EdgeInsets.all(10),
                    child: Opacity(
                      opacity: 0.8,
                      child: Center(
                        child: Text(
                          "No image selected",
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
            (imageSelect)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: defaultMargin),
                        child: Text(
                          'Hasil Klasifikasi Sayuran',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kBlueColor),
                          ),
                          Container(
                            height: 16,
                            width: 16,
                            margin:
                                EdgeInsets.only(left: 10, right: defaultMargin),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: kBlueColor),
                          )
                        ],
                      )
                    ],
                  )
                : SizedBox(),
            SingleChildScrollView(
              child: Column(
                children: (imageSelect)
                    ? _results.map((result) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              left: defaultMargin,
                              right: defaultMargin,
                              top: 12,),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            children: [
                              if (result['label'] == "Bean") ...[
                                ImageVege("assets/images/img-bean.jpg")
                              ] else if (result['label'] == "Bitter_Gourd") ...[
                                ImageVege("assets/images/img-bitter.jpg")
                              ] else if (result['label'] == "Bottle_Gourd") ...[
                                ImageVege("assets/images/img-bottle.jpg")
                              ] else if (result['label'] == "Brinjal") ...[
                                ImageVege("assets/images/img-brinjal.jpg")
                              ] else if (result['label'] == "Broccoli") ...[
                                ImageVege("assets/images/img-brokoli.jpg")
                              ] else if (result['label'] == "Cabbage") ...[
                                ImageVege("assets/images/img-cabbage.jpg")
                              ] else if (result['label'] == "Capsicum") ...[
                                ImageVege("assets/images/img-paprika.jpg")
                              ] else if (result['label'] == "Carrot") ...[
                                ImageVege("assets/images/img-carrot.jpg")
                              ] else if (result['label'] == "Cauliflower") ...[
                                ImageVege("assets/images/img-cauli.jpg")
                              ] else if (result['label'] == "Cucumber") ...[
                                ImageVege("assets/images/img-cucumber.jpg")
                              ] else if (result['label'] == "Papaya") ...[
                                ImageVege("assets/images/img-papaya.jpg")
                              ] else if (result['label'] == "Potato") ...[
                                ImageVege("assets/images/img-potato.jpg")
                              ] else if (result['label'] == "Pumpkin") ...[
                                ImageVege("assets/images/img-pumpkin.jpg")
                              ] else if (result['label'] == "Radish") ...[
                                ImageVege("assets/images/img-radish.jpg")
                              ] else if (result['label'] == "Tomato") ...[
                                ImageVege("assets/images/img-tomato.jpg")
                              ] else ...[
                                ImageVege("assets/images/img-vege.png")
                              ],
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${result['label']}",
                                        // maxLines: 1,
                                        // overflow: TextOverflow.ellipsis,
                                        style: blackTextStyle.copyWith(
                                            fontSize: 18, fontWeight: medium)),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Akurasi',
                                      style: greyTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: light,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/ic-star.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text(
                                        "${(result['confidence'] * 100).toStringAsFixed(2)} %",
                                        style: blackTextStyle.copyWith(
                                            fontSize: 14, fontWeight: medium)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList()
                    : [],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 70.0,
            width: 70.0,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: pickCameraImage,
              tooltip: "Pick Camera Image",
              child: Image.asset(
                "assets/images/img-camera.png",
                height: 42,
              ),
            ),
          ),
          SizedBox(width:14),
          Container(
            height: 70.0,
            width: 70.0,
            child: FloatingActionButton(
              onPressed: pickImage,
              heroTag: null,

              tooltip: "Pick Image",
              child: Image.asset(
                "assets/images/ic-add.png",
                height: 42,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }

  Future pickCameraImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}
