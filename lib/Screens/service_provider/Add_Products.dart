import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purpleavapp/Modal/post_product_model.dart';
import 'package:purpleavapp/Screens/service_provider/My_Products.dart';
import 'package:purpleavapp/Services/ApiServices.dart';
import 'package:purpleavapp/Services/storage_services.dart';



import 'package:http/http.dart' as http;
import '../../Widgets/image_widgets.dart';

final StorageServices _services = StorageServices();


class AddProducts extends StatefulWidget {

   AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}
final storage =  FlutterSecureStorage();

class _AddProductsState extends State<AddProducts> {
  final TextEditingController _equipment = TextEditingController();
  final TextEditingController _model = TextEditingController();
  final TextEditingController _brand = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _shippingPrice = TextEditingController();
  final TextEditingController _weekendPrice = TextEditingController();
  final TextEditingController _oneDayPrice = TextEditingController();
  final TextEditingController _twoDayPrice = TextEditingController();
  final TextEditingController _threeDayPrice = TextEditingController();
  final TextEditingController _weeklyPrice = TextEditingController();
  final TextEditingController _package1 = TextEditingController();
  final TextEditingController _package2 = TextEditingController();
  final TextEditingController _package1Price = TextEditingController();
  final TextEditingController _package2Price = TextEditingController();
  final TextEditingController _inventory = TextEditingController();
  final TextEditingController _delivery = TextEditingController();
  final TextEditingController _moreInformation = TextEditingController();
  final TextEditingController _termsAndConditons = TextEditingController();
  final TextEditingController _landmark = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _postal = TextEditingController();
  List<bool> value = [
    false,
    false,
    false,
  ];
  List<File?>imageList=[];
  List<String>category=[
    "Audio",
    "Video",
    "Lighting",
    "Stage",
    "Network",
    "Instruments",
    "Production",
    "Crew",
    "Other"
  ];
  String? selectedItem = 'Audio';

  List<String>title=[
    "Delivery",
    "Pickup",
    "Shipping"
  ];
  FilePickerResult? _file;

  Future getManual1() async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    setState(() {
      _file= file;
    });

    if (file != null) {
      List<File> files = file.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }

    setState(() {

    });
  }

  // userProductPost(GetAllProductsModel model) async {
  //   bool? status = await postAllProducts(model);
  //   if (status!) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => MyProducts()));
  //     print("product added successfully");
  //   } else {
  //     print("try again later");
  //   }
  // }


  bool form = false;
  File? _image1;
  File? _image2;
  File? _image3;
  File? _image4;
  File? _image5;
  bool price = false;
  bool package = false;
  bool delivery = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6= false;
  bool value7= false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff5600d4),
        title: Row(
          children: [
            Text('Add Products',
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Total Products",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "128",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 31,
                                  height: 31,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.arrow_forward_ios,
                                    color: Colors.white,)
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Product In",
                            style: TextStyle(
                              color: Color(0xccffffff),
                              fontSize: 16,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff5600d4),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Stock In Hand",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "500",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 31,
                                  height: 31,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(Icons.arrow_forward_ios,
                                    color: Colors.white,)
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Product Out",
                            style: TextStyle(
                              color: Color(0xccffffff),
                              fontSize: 16,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),

                    width: 160,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff5600d4),
                    ),
                  ),


                ],
              ),

              form ? addProduct(context) : GestureDetector(
                  onTap: () {
                    setState(() {
                      form = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: 363,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Color(0xff5600d4), width: 1.50,),
                      ),

                      child: Center(
                        child: Text(
                          "Add Product",
                          style: TextStyle(
                            color: Color(0xff5600d4),
                            fontSize: 20,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget addProduct(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text(
          "Upload Equipment Images ",
          style: TextStyle(
            color: Color(0xff0a0a0a),
            fontSize: 18,
            fontFamily: "Lato",
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10,),
        GestureDetector(onTap: () {
          showDialog(context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          color: Color(0xffd72027),
                                          shape: BoxShape.circle,

                                        ),
                                        child: Icon(
                                          Icons.close, color: Colors.white,
                                          size: 15,),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5),
                                    child: GestureDetector(onTap: () {
                                      getImage(ImageSource.gallery).then((
                                          value) {
                                        setState(() {
                                          if (_image1 == null) {
                                            setState(() {
                                              _image1 = File(value!.path);
                                              imageList.add(_image1);
                                            });
                                          } else if (_image2 == null) {
                                            setState(() {
                                              _image2 = File(value!.path);
                                              imageList.add(_image2);
                                            });
                                          } else if (_image3 == null) {
                                            setState(() {
                                              _image3 = File(value!.path);
                                              imageList.add(_image3);
                                            });
                                          } else if (_image4 == null) {
                                            setState(() {
                                              _image4 = File(value!.path);
                                            });
                                          }
                                        });
                                      });
                                      Navigator.pop(context);
                                    },
                                      child: Container(
                                        width: 289,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              4),
                                          color: Color(0xff5600d4),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Import from gallery",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5),
                                    child: GestureDetector(onTap: () {
                                      getImage(ImageSource.camera).then((
                                          value) {
                                        setState(() {
                                          if (_image1 == null) {
                                            setState(() {
                                              _image1 = File(value!.path);
                                              imageList.add(_image1);
                                            });
                                          } else if (_image2 == null) {
                                            setState(() {
                                              _image2 = File(value!.path);
                                              imageList.add(_image2);
                                            });
                                          } else if (_image3 == null) {
                                            setState(() {
                                              _image3 = File(value!.path);
                                              imageList.add(_image3);

                                            });
                                          } else if (_image4 == null) {
                                            setState(() {
                                              _image4 = File(value!.path);
                                            });
                                          }
                                        });
                                      });
                                      Navigator.pop(context);
                                    },
                                      child: Container(
                                        width: 289,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              4),
                                          color: Color(0xff5600d4),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Import from Camera",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),

                        ],
                      ),
                    ),
                  ),
                );
              });
        },
          child: Container(
            width: 365,
            height: 203,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/upload.png'),
                Text(
                  "Upload up to 5 image",
                  style: TextStyle(
                    color: Color(0xffa3a3a3),
                    fontSize: 18,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "(345×255 or larger recommended, up to )",
                  style: TextStyle(
                    color: Color(0xffa3a3a3),
                    fontSize: 14,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
              color: Color(0xfff6f6f6),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 84,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  List<File?>name = [
                    _image1,
                    _image2,
                    _image3,
                    _image4,
                    _image5,
                  ];

                  return Padding(padding: EdgeInsets.only(right: MediaQuery
                      .of(context)
                      .size
                      .width * 0.025),
                    child: name[index] != null
                        ? Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          GestureDetector(onTap: () {
                            setState(() {
                              removeImage(index);
                            });
                          },
                              child: Icon(Icons.cancel)
                          ),
                        ],
                      ),


                      width: 82,
                      height: 84,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: FileImage(name[index]!)
                        ),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Color(0xffdbdbdb),
                          width: 1.50,),
                        color: Color(0xfff6f6f6),
                      ),
                    )
                        : Container(
                      width: 82,
                      height: 84,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Color(0xffdbdbdb),
                          width: 1.50,),
                        color: Color(0xfff6f6f6),
                      ),
                    ),);
                }),
          ),
        ),


        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              getManual1();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff5600d4),
              ),
              height: 50,
              alignment: Alignment.center,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Center(
                      child: Text('Upload Manual (pdf only)', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ),
                    Spacer(),

                    Image.asset('images/pdf.png')
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Equipment Details",
            style: TextStyle(
              color: Color(0xff0a0a0a),
              fontSize: 18,
              fontFamily: "Lato",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _equipment,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Equipment Name *',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _model,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Model',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),

        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _brand,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Brand',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        SizedBox(height: 5,),
        SizedBox(
          width: 365,
          height: 60,
          child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(width: 1, color: Colors.grey)
                  ),
                disabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(width: 1, color: Colors.grey)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(width: 1, color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(width: 1, color: Colors.grey)
                ),

              ),
              value: selectedItem,
              items: category
                  .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),))).toList(),
              onChanged: (items) => setState(() {
                selectedItem = items;
              }) ),
        ),
        SizedBox(height: 5,),


        Row(
          children: [
            Checkbox(
              fillColor:
              MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Color(0xff5600d4);
                }
                return Color(0xff5600d4);
              }),
              value: value1,
              onChanged: (val) {
                setState(() {
                  value1 = val!;


                });
              },

            ),
            SizedBox(
              width: 5,
            ),
            Text("Weekend Special",
              style: TextStyle(
                  fontSize: 16
              ),),
            Spacer(),
            Text("\$",
              style: TextStyle(
                  fontSize: 20
              ),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              child: TextField(
                controller: _weekendPrice,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Checkbox(
              fillColor:
              MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Color(0xff5600d4);
                }
                return Color(0xff5600d4);
              }),
              value: value2,
              onChanged: (val) {
                setState(() {
                  value2 = val!;


                });
              },

            ),
            SizedBox(
              width: 5,
            ),
            Text("One day Price",
              style: TextStyle(
                  fontSize: 16
              ),),
            Spacer(),
            Text("\$",
              style: TextStyle(
                  fontSize: 20
              ),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              child: TextField(
                controller: _oneDayPrice,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Checkbox(
              fillColor:
              MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Color(0xff5600d4);
                }
                return Color(0xff5600d4);
              }),
              value: value3,
              onChanged: (val) {
                setState(() {
                  value3 = val!;


                });
              },

            ),
            SizedBox(
              width: 5,
            ),
            Text("Two day Rental Price",
              style: TextStyle(
                  fontSize: 16
              ),),
            Spacer(),
            Text("\$",
              style: TextStyle(
                  fontSize: 20
              ),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              child: TextField(
                controller: _twoDayPrice,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Checkbox(
              fillColor:
              MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Color(0xff5600d4);
                }
                return Color(0xff5600d4);
              }),
              value: value4,
              onChanged: (val) {
                setState(() {
                  value4 = val!;


                });
              },

            ),
            SizedBox(
              width: 5,
            ),
            Text("Three day Rental Price",
              style: TextStyle(
                  fontSize: 16
              ),),
            Spacer(),

            Text("\$",
              style: TextStyle(
                  fontSize: 20
              ),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              child: TextField(
                controller: _threeDayPrice,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Checkbox(
              fillColor:
              MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Color(0xff5600d4);
                }
                return Color(0xff5600d4);
              }),
              value: value5,
              onChanged: (val) {
                setState(() {
                  value5 = val!;
                });
              },

            ),
            SizedBox(
              width: 5,
            ),
            Text("Weekly Rental Price",
              style: TextStyle(
                  fontSize: 16
              ),),
            Spacer(),
            Text("\$",
              style: TextStyle(
                  fontSize: 20
              ),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              child: TextField(
                controller: _weeklyPrice,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Checkbox(
              fillColor:
              MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Color(0xff5600d4);
                }
                return Color(0xff5600d4);
              }),
              value: value6,
              onChanged: (val) {
                setState(() {
                  value6 = val!;
                });
              },

            ),
            SizedBox(
              width: 15,
            ),
            Text("Package 1",
              style: TextStyle(
                  fontSize: 16
              ),),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              child: TextField(
                controller: _package1,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            ),
            Spacer(),
            Text("\$",
              style: TextStyle(
                  fontSize: 20
              ),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.2,
              child: TextField(
                controller: _package1Price,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Checkbox(
              fillColor:
              MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Color(0xff5600d4);
                }
                return Color(0xff5600d4);
              }),
              value: value7,
              onChanged: (val) {
                setState(() {
                  value7 = val!;
                });
              },

            ),
            SizedBox(
              width: 15,
            ),
            Text("Package 2",
              style: TextStyle(
                  fontSize: 16
              ),),
            Spacer(),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.3,
              child: TextField(
                controller: _package2,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            ),
            Spacer(),
            Text("\$",
              style: TextStyle(
                  fontSize: 20
              ),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width*0.2,
              child: TextField(
                controller: _package2Price,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                ),
              ),
            )
          ],
        ),

        SizedBox(height: 10,),

        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _inventory,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Inventory *',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),


        SizedBox(height: 5,),
        GestureDetector(
          onTap: () {
            setState(() {
              if (delivery) {
                delivery = false;
              } else {
                delivery = true;
              }
            });
          },
          child: Container(
              width: 365,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery & Pickup *",
                      style: TextStyle(
                        color: Color(0xffb9b9b9),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),),

                    delivery ? Icon(Icons.keyboard_arrow_up) : Icon(
                        Icons.keyboard_arrow_down)
                  ],
                ),
              )
            // TextField(
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: 'Price',
            //     hintStyle: TextStyle(
            //       color: Color(0xffb9b9b9),
            //       fontSize: 16,
            //       fontFamily: "Lato",
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
          ),
        ),

        /// here I have imported my custom dropdown
        /// just change list content name
        ListView.builder(
            itemCount: title.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: index!=0?ExpansionTile(
                  title: Row(
                    children: [
                      Checkbox(
                          fillColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Color(0xff5600d4);
                            }
                            return Color(0xff5600d4);
                          }),
                          value: value[index],
                          onChanged: (val) {
                            setState(() {
                              value[index] = val!;
                            });
                          }),
                      SizedBox(
                        width: 15,
                      ),
                      Text(title[index]),
                    ],
                  ),
                  children: [
                    index==2?Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                            color: Colors.white,
                          ),
                          child: TextField(
                            controller: _shippingPrice,
                            decoration: InputDecoration(border: InputBorder.none,
                                hintText:"Enter Shipping Price",
                                contentPadding: EdgeInsets.symmetric(horizontal: 5)
                            ),
                          )),
                    ):addressForm(context),

                  ],
                )
                    : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Checkbox(
                          fillColor:
                          MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Color(0xff5600d4);
                            }
                            return Color(0xff5600d4);
                          }),
                          value: value[index],
                          onChanged: (val) {
                            setState(() {
                              value[index] = val!;
                            });
                          }),
                      SizedBox(
                        width: 15,
                      ),
                      Text(title[index]),
                    ],
                  ),
                ),
              );
            }),
        SizedBox(height: 5,),
        Container(
          width: 365,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _moreInformation,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'More Information',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Container(
          width: 365,
          height: 159,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50,),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _termsAndConditons,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Term & Conditions',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 40),
        GestureDetector(
          onTap: () {
            uploadImage(_image1!);

            setState(() {
              form = false;
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyProducts()));
            });
          },
          child: Container(
              height: 50,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                  color: Color(0xff5600d4),
                  borderRadius: BorderRadius.circular(20)

              ),
              child: Center(
                child: Text(
                  "Add Product",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )

          ),
        ),

      ],
    );
  }

  void removeImage(int index) {
    switch (index) {
      case 0:
        _image1 = null;
        break;
      case 1:
        _image2 = null;
        break;
      case 2:
        _image3 = null;
        break;
      case 3:
        _image4 = null;
        break;
    }
  }

  void uploadImage(File _image1)async{
    String? tokenValue = await _services.getToken();
    debugPrint(tokenValue);
    debugPrint(_image1.path);
    debugPrint(_file.toString());
    debugPrint(_equipment.text);
    debugPrint(_model.text);
    debugPrint(_brand.text);
    debugPrint(categoryChange(selectedItem!));
    debugPrint(_shippingPrice.text);
    debugPrint(_weekendPrice.text);
    debugPrint(_oneDayPrice.text);
    debugPrint(_twoDayPrice.text);
    debugPrint(_threeDayPrice.text);
    debugPrint(_weeklyPrice.text);
    debugPrint(_package1.text);
    debugPrint(_package2.text);
    debugPrint(_moreInformation.text);
    debugPrint(_termsAndConditons.text);
    debugPrint(_inventory.text);
    debugPrint(_delivery.text);
    var stream = http.ByteStream(DelegatingStream.typed(_image1.openRead()));
    var length = await _image1.length();

    Map<String, String> headers = { "Authorization": "Bearer $tokenValue"};
    var uri =Uri.parse("https://purpleapp.omkatech.com/api/products",
      );

    var request=http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    request.fields["name"] = _equipment.text;
    request.fields["model"] = _model.text;
    request.fields["brand"] = _brand.text;
    request.fields["category id"] = categoryChange(selectedItem!);
    request.fields["shipping_cost"] = _shippingPrice.text;
    request.fields["more_info"] = _moreInformation.text;
    request.fields["terms_conditions"] = _termsAndConditons.text;
    request.fields["one_day_price"] = _oneDayPrice.text;
    request.fields["two_day_price"] = _twoDayPrice.text;
    request.fields["three_day_price"] = _threeDayPrice.text;
    request.fields["weekly_price"] =  _weeklyPrice.text;
    request.fields["weekend_price"] = _weekendPrice.text;
    request.fields["package_1"] = _package1.text;
    request.fields["package_2"] = _package2.text;
    request.fields["package_1_price"] = _package1Price.text;
    request.fields["package_2_price"] = _package2Price.text;
    request.fields["inventory"] = _inventory.text;
    request.fields["address"] = _delivery.text;
    request.fields["landmark"] = _delivery.text;
    request.fields["country"] = _delivery.text;
    request.fields["state"] = _delivery.text;
    request.fields["city"] = _delivery.text;
    request.fields["postal_code"] = _delivery.text;

    // var multipartFile= http.MultipartFile('images[]', stream, length,filename: _image1.path);

    List<http.MultipartFile> newList = <http.MultipartFile>[];

    for (int i = 0; i < imageList.length; i++) {
      var path =  imageList[i]!.path;
      File imageFile =  File(path);

      var stream =  http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile =  http.MultipartFile("images[]", stream, length,
          filename: imageFile.path);
      newList.add(multipartFile);
    }
    request.files.addAll(newList);
    await request.send().then((response) async{

      response.stream.transform(utf8.decoder).listen((value) async {

        debugPrint(value);
        String checkStatus = status(json.decode(value));
        debugPrint(checkStatus);
        if(checkStatus == "false"){
          debugPrint("Not added");
          String msg = fromJson(json.decode(value));
          Fluttertoast.showToast(msg: msg);
        }else{
          debugPrint("added");
        }


      });
    }).catchError((e){
      print(e);
    });
  }
  String fromJson(Map<String, dynamic> json) =>
      json["message"];
  String status(Map<String, dynamic> json) =>
      json["status"];


  Widget addressForm(BuildContext context){
    return Column(
      children: [
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _delivery,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Address',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _landmark,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Land Mark',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _country,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Country',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _state,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'State',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _city,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'City',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _postal,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Postal Code',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),

        /// here you have to add all form fieds
      ],
    );
  }

  String categoryChange(String selectedCat){
    switch(selectedCat){
      case "Audio":
        return "1";
      case "Video":
        return "2";
      case "Lighting":
        return "3";
      case  "Stage":
        return "4";
      case  "Network":
        return "5";
      case "Instruments":
        return "6";
      case  "Production":
        return "7";
      case "Crew":
        return "8";
      case "Other":
        return "9";
      default :
        return "1";
    }
  }


}
