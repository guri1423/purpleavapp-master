
import 'dart:io';
import 'dart:math';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:purpleavapp/Modal/renter_model/add_to_cart_modal.dart';
import 'package:purpleavapp/Modal/renter_model/category_search_modal.dart';
import 'package:purpleavapp/Screens/RenterScreens/Cart_Screen.dart';
import 'package:purpleavapp/Screens/service_provider/SignUp.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

class ProductDetails extends StatefulWidget {
  DataCategory model;
  ProductDetails({Key? key,
    required this.model

  }) : super(key: key);

  @override

  State<ProductDetails> createState() => _ProductDetailsState();
}


class _ProductDetailsState extends State<ProductDetails> {
  bool _ischecked=false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6= false;
  bool value7= false;
  bool value8= false;
  bool value9= false;
  bool value10= false;

  bool form = false;

  // bool downloading = false;
  var progress = "";
  var path = "No Data";
  var platformVersion = "Unknown";
  var _onPressed;
  late Directory externalDir;

  final TextEditingController _landmark = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _postal = TextEditingController();

  String convertCurrentDateTimeToString() {
    String formattedDateTime =
    DateFormat('yyyyMMdd_kkmmss').format(DateTime.now()).toString();
    return formattedDateTime;
  }

  Future<void> downloadFile(String pdfUrl) async {
    Dio dio = Dio();


    final status = await Permission.storage.request();
    if (status.isGranted) {
      String dirloc = "";
      if (Platform.isAndroid) {
        dirloc = "/sdcard/download/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }

      try {
        FileUtils.mkdir([dirloc]);
        await dio.download(pdfUrl, dirloc + convertCurrentDateTimeToString() + ".pdf",
            onReceiveProgress: (receivedBytes, totalBytes) {
              print('here 1');
              setState(() {
                // downloading = true;

                progress = ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Downloading File: $progress')));
                print(progress);
              });
              print('here 2');
            });
      } catch (e) {
        print('catch catch catch');
        print(e);
      }

      setState(() {
        progress = "Download Completed.";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(' $progress')));


        path = dirloc + convertCurrentDateTimeToString() + ".pdf";
      });
      print(path);
      print('here give alert-->completed');
    } else {
      setState(() {
        progress = "Permission Denied!";
        _onPressed = () {
          downloadFile(pdfUrl);
        };
      });
    }
  }


  DateTime date= DateTime(2022,12,24);
  DateTime returnDate= DateTime(2022,12,29);



  int counter = 1;

   incrementCounter(){
    setState(() {
      counter++;
    });
  }
   decrementCounter(){
     setState(() {
       counter--;
       counter = max(1, counter - 10);
     });
   }

   String? url;
   String? name;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xff5600d4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Product details",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children:[

                    Text(
                      "(31 Reviews)",
                      style: TextStyle(
                        color: Color(0xff6f6f6f),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Text(
                    //   "4",
                    //   style: TextStyle(
                    //     color: Color(0xff2d2d2d),
                    //     fontSize: 16,
                    //   ),
                    // ),
                    Icon(
                      Icons.star,
                      color: Color(0xff5600d4),
                      size: 25,

                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xff5600d4),
                      size: 25,

                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xff5600d4),
                      size: 25,

                    ),
                  ],
                ),
              ),
              Container(
                child: Image.network("https://purpleapp.omkatech.com/${widget.model.productImages![0].url}"),
                width: 370,
                height: 199,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color(0xfff4f4f4),
                ),
              ),
              SizedBox(height: 10,),
             SizedBox(
               width:MediaQuery.of(context).size.width,
               height: 75,
               child: ListView.builder(

                 itemCount: widget.model.productImages!.length,
                 scrollDirection: Axis.horizontal,
                 shrinkWrap: true,
                 itemBuilder: (context,index)=> Padding(
                   padding: const EdgeInsets.only(right: 8),
                   child: Container(
                     child: Image.network("https://purpleapp.omkatech.com/${widget.model.productImages![index].url}"),
                   width: 75,
                   height: 75,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(4),
                     color: Color(0xfff4f4f4),
                   ),
               ),
                 ),),
             ),
              SizedBox(height: 10),
              Text(
                widget.model.name!,
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 22,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Text(
               ' \$${widget.model.oneDayPrice!} per day',
                style: TextStyle(
                  color: Color(0xff5600d4),
                  fontSize: 22,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              // Container(
              //   width: 364,
              //   height: 115,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(2),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color(0x3f000000),
              //         blurRadius: 4,
              //         offset: Offset(0, 0),
              //       ),
              //     ],
              //     color: Colors.white,
              //   ),
              //   child: Stack(
              //     children:[
              //       Positioned(
              //         left: 38,
              //         top: 22,
              //         child: Text(
              //           "Review",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 22,
              //             fontFamily: "Lato",
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         left: 38,
              //         top: 70,
              //         child: Container(
              //           width: 157.42,
              //           height: 22.42,
              //           child: Stack(
              //             children:[],
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         left: 217,
              //         top: 26,
              //         child: Text(
              //           "(31 Reviews)",
              //           style: TextStyle(
              //             color: Color(0xff6f6f6f),
              //             fontSize: 16,
              //             fontFamily: "Lato",
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         left: 217,
              //         top: 75,
              //         child: Text(
              //           "4 out of 5",
              //           style: TextStyle(
              //             color: Color(0xff2d2d2d),
              //             fontSize: 12,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 10,),
              Text(
                "Brand: ${widget.model.brand}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Model:${widget.model.model}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Description:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Text( widget.model.moreInfo!,
                style: TextStyle(
                  color: Color(0xff6f6f6f),
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Term & Condition:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                widget.model.termsConditions!,
                style: TextStyle(
                  color: Color(0xff6f6f6f),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){


                  // loadPdfFromNetwork("https://purpleapp.omkatech.com/${widget.model.manualPdf}");
                 downloadFile("https://purpleapp.omkatech.com/${widget.model.manualPdf}");

                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Download Manual PDF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  width: 365,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                    color: Color(0xff5600d4),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(

                height: 28,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      "Quantity: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 32),
                    Container(
                      width: 120,
                      height: 28,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          GestureDetector(

                            onTap: decrementCounter,
                            child: Container(
                              width: 34,
                              height: 28,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffcacaca), width: 1, ),
                                color: Color(0xffeaeaea),
                              ),
                              child: Icon(Icons.remove),

                            ),
                          ),

                          SizedBox(width: 10.50),
                          Text(
                            '$counter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff2d2d2d),
                              fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10.50),
                          GestureDetector(
                            onTap: incrementCounter,

                            child: Container(
                              width: 34,
                              height: 28,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffcacaca), width: 1, ),
                                color: Color(0xffeaeaea),
                              ),
                              child: Icon(Icons.add),


                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 10,),
              // Container(
              //   alignment: Alignment.center,
              //   child: Text(
              //     "Choose Rent Options",
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 16,
              //       fontFamily: "Lato",
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              //   width: 365,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4),
              //     border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
              //     color: Color(0xfff0f0f0),
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   width: 351,
              //   height: 22,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:[
              //       Checkbox(
              //           fillColor: MaterialStateProperty.resolveWith<Color>((
              //               states) {
              //             if (states.contains(MaterialState.disabled)) {
              //               return Color(0xff5600d4);
              //             }
              //             return Color(0xff5600d4);
              //           }),
              //           value: value1, onChanged: (value) {
              //         value1 = !value1;
              //         setState(() {
              //
              //         });
              //       }),
              //       SizedBox(width: 40),
              //       Text(
              //         "Three day Rental Price",
              //         style: TextStyle(
              //           color: Color(0xff2d2d2d),
              //           fontSize: 16,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //           "\$${widget.model.threeDayPrice}",
              //         style: TextStyle(
              //           color: Color(0xff5600d4),
              //           fontSize: 18,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   width: 351,
              //   height: 22,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:[
              //       Checkbox(
              //           fillColor: MaterialStateProperty.resolveWith<Color>((
              //               states) {
              //             if (states.contains(MaterialState.disabled)) {
              //               return Color(0xff5600d4);
              //             }
              //             return Color(0xff5600d4);
              //           }),
              //           value: value2, onChanged: (value) {
              //         value2 = !value2;
              //         setState(() {
              //
              //         });
              //       }),
              //       SizedBox(width: 40),
              //       Text(
              //         "Weekend Special",
              //         style: TextStyle(
              //           color: Color(0xff2d2d2d),
              //           fontSize: 16,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //         "\$${widget.model.weekendPrice}",
              //         style: TextStyle(
              //           color: Color(0xff5600d4),
              //           fontSize: 18,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   width: 351,
              //   height: 22,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:[
              //       Checkbox(
              //           fillColor: MaterialStateProperty.resolveWith<Color>((
              //               states) {
              //             if (states.contains(MaterialState.disabled)) {
              //               return Color(0xff5600d4);
              //             }
              //             return Color(0xff5600d4);
              //           }),
              //           value: value3, onChanged: (value) {
              //         value3 = !value3;
              //         setState(() {
              //
              //         });
              //       }),
              //       SizedBox(width: 40),
              //       Text(
              //         "One day Price",
              //         style: TextStyle(
              //           color: Color(0xff2d2d2d),
              //           fontSize: 16,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //         "\$${widget.model.oneDayPrice}",
              //         style: TextStyle(
              //           color: Color(0xff5600d4),
              //           fontSize: 18,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   width: 351,
              //   height: 22,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:[
              //       Checkbox(
              //           fillColor: MaterialStateProperty.resolveWith<Color>((
              //               states) {
              //             if (states.contains(MaterialState.disabled)) {
              //               return Color(0xff5600d4);
              //             }
              //             return Color(0xff5600d4);
              //           }),
              //           value: value4, onChanged: (value) {
              //         value4 = !value4;
              //         setState(() {
              //
              //         });
              //       }),
              //       SizedBox(width: 40),
              //       Text(
              //         "Two day Rental Price",
              //         style: TextStyle(
              //           color: Color(0xff2d2d2d),
              //           fontSize: 16,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //           "\$${widget.model.twoDayPrice}",
              //         style: TextStyle(
              //           color: Color(0xff5600d4),
              //           fontSize: 18,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   width: 351,
              //   height: 22,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:[
              //       Checkbox(
              //           fillColor: MaterialStateProperty.resolveWith<Color>((
              //               states) {
              //             if (states.contains(MaterialState.disabled)) {
              //               return Color(0xff5600d4);
              //             }
              //             return Color(0xff5600d4);
              //           }),
              //           value: value5, onChanged: (value) {
              //         value5 = !value5;
              //         setState(() {
              //
              //         });
              //       }),
              //       SizedBox(width: 40),
              //       Text(
              //         "Three day Rental Price",
              //         style: TextStyle(
              //           color: Color(0xff2d2d2d),
              //           fontSize: 16,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //         "\$${widget.model.twoDayPrice}",
              //         style: TextStyle(
              //           color: Color(0xff5600d4),
              //           fontSize: 18,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   width: 351,
              //   height: 22,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:[
              //       Checkbox(
              //           fillColor: MaterialStateProperty.resolveWith<Color>((
              //               states) {
              //             if (states.contains(MaterialState.disabled)) {
              //               return Color(0xff5600d4);
              //             }
              //             return Color(0xff5600d4);
              //           }),
              //           value: value6, onChanged: (value) {
              //         value6 = !value6;
              //         setState(() {
              //
              //         });
              //       }),
              //       SizedBox(width: 40),
              //       Text(
              //         "Weekly Rental Price",
              //         style: TextStyle(
              //           color: Color(0xff2d2d2d),
              //           fontSize: 16,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //         "\$${widget.model.weeklyPrice}",
              //         style: TextStyle(
              //           color: Color(0xff5600d4),
              //           fontSize: 18,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Text(
              //   "Packages",
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 16,
              //     fontFamily: "Lato",
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   width: 351,
              //   height: 22,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:[
              //       Checkbox(
              //           fillColor: MaterialStateProperty.resolveWith<Color>((
              //               states) {
              //             if (states.contains(MaterialState.disabled)) {
              //               return Color(0xff5600d4);
              //             }
              //             return Color(0xff5600d4);
              //           }),
              //           value: value7, onChanged: (value) {
              //         value7 = !value7;
              //         setState(() {
              //
              //         });
              //       }),
              //       SizedBox(width: 40),
              //       Text(
              //         "Package 1",
              //         style: TextStyle(
              //           color: Color(0xff2d2d2d),
              //           fontSize: 16,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //       "\$${widget.model.package1Price}",
              //         style: TextStyle(
              //           color: Color(0xff5600d4),
              //           fontSize: 18,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              // Container(
              //   width: 351,
              //   height: 22,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children:[
              //       Checkbox(
              //           fillColor: MaterialStateProperty.resolveWith<Color>((
              //               states) {
              //             if (states.contains(MaterialState.disabled)) {
              //               return Color(0xff5600d4);
              //             }
              //             return Color(0xff5600d4);
              //           }),
              //           value: value8, onChanged: (value) {
              //         value8 = !value8;
              //         setState(() {
              //
              //         });
              //       }),
              //       SizedBox(width: 40),
              //       Text(
              //         "Package 2",
              //         style: TextStyle(
              //           color: Color(0xff2d2d2d),
              //           fontSize: 16,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       Spacer(),
              //       Text(
              //         "\$${widget.model.package2Price}",
              //         style: TextStyle(
              //           color: Color(0xff5600d4),
              //           fontSize: 18,
              //           fontFamily: "Lato",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              Text(
                "Delivery or Pickup: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),

              Container(
                width: 351,
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Checkbox(
                        fillColor: MaterialStateProperty.resolveWith<Color>((
                            states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Color(0xff5600d4);
                          }
                          return Color(0xff5600d4);
                        }),
                        value: value9, onChanged: (value) {
                      value9 = !value9;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "Pick up",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 351,
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                     Checkbox(
                          fillColor: MaterialStateProperty.resolveWith<Color>((
                              states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Color(0xff5600d4);
                            }
                            return Color(0xff5600d4);
                          }),
                          value: value10, onChanged: (value) {
                        setState(() {
                          value10 = !value10;
                          form = !form;
                        });
                      }),
                    SizedBox(width: 40),
                  Text(
                     "Shipping",
                     style: TextStyle(
                       color: Color(0xff2d2d2d),
                       fontSize: 16,
                       fontFamily: "Lato",
                       fontWeight: FontWeight.w500,
                     ),
                   ),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Delivery or Pickup Date: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  '${date.day}/${date.month}/${date.year}',
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 16,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () async{
                DateTime? newDate = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2000) , lastDate: DateTime(2100));
                if(newDate == null) return;
                //
                setState(() {
                  date = newDate;
                });
              }, child: Center(child: Text('Select Date'))),
              Text(
                "Return or End Date: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  '${returnDate.day}/${returnDate.month}/${returnDate.year}',
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 16,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10,),


              ElevatedButton(onPressed: ()async{
                DateTime? newReturnDate = await showDatePicker(context: context, initialDate: returnDate, firstDate: DateTime(2000) , lastDate: DateTime(2100));
                if(newReturnDate == null) return;

                setState(() {
                  returnDate = newReturnDate;
                });
              }, child: Center(child: Text('Select Date'))),

              SizedBox(height: 10,),

              form? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal:
                10),
                child: addressForm(context),
              ): Container(),




              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{

                  bool? status = await productAddToCart(AddCart(
                    productId:widget.model.id.toString() ,
                    quantity: counter.toString() ,
                    rent: "One Day",
                    rentPrice: widget.model.oneDayPrice ,
                    // package: packageType(),
                    delivery: deliveryMethod(),
                    startDate: date.toString(),
                    endDate: returnDate.toString(),
                    totalAmount: totalPrice().toString(),

                  )

                  );
                  debugPrint(widget.model.id.toString());
                  debugPrint(counter.toString() );
                  debugPrint(widget.model.oneDayPrice);
                  debugPrint(deliveryMethod());
                  debugPrint(date.toString());
                  debugPrint(returnDate.toString());
                  debugPrint(totalPrice().toString());

                  debugPrint(status.toString());

                  if(status!){
                    debugPrint("added");
                    Fluttertoast.showToast(msg: status.toString());
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RenterCart()));

                  }else{
                    debugPrint("not added");
                  }

                },
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Container(
                      alignment: Alignment.center,
                      width: 363,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xff5600d4),
                      ),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )




            ],
          ),
        ),
      ),


    );
  }

  String rentType(){
    if(value1 == true){
      return "Three Day";
    }else if(value2 == true){
      return "Weekend";
    }else if(value3 == true){
      return "One Day";
    }else if(value4 == true){
      return "Two Day";
    }else if(value5 == true){
      return "Three Day";
    }else if(value6 == true){
      return "Weekly";
    }else{
      return "One Day";
    }
  }
  String rentPrice(){
    // if(value1 == true){
    //   return widget.model.threeDayPrice!;
    // }
    //  if(value2 == true){
    //   return widget.model.weekendPrice!;
    // }else

      if(value3 == true){
      return widget.model.oneDayPrice!;
    }
    // else if(value4 == true){
    //   return widget.model.twoDayPrice!;
    // }else if(value5 == true){
    //   return widget.model.threeDayPrice!;
    // }else if(value6 == true){
    //   return widget.model.weeklyPrice!;
    // }
    else{
      return widget.model.oneDayPrice!;
    }
  }
  String deliveryMethod(){
    if(value9 == true){
     return "Pick up";
    }else if(value10 == true){
      return "Shipping";
    }else{
      return "Pick up";
    }
  }

  String packageType(){
    if(value7 == true){
      return "Package 1";
    }else if(value8 == true){
      return "Package 2";
    }else{
      return "Package 1";
    }
  }
  // String packagePrice(){
  //   if(value7 == true){
  //     return widget.model.package1Price!;
  //   }else if(value8 == true){
  //     return widget.model.package2Price!;
  //   }else{
  //     return widget.model.package1Price!;
  //   }
  // }



  dynamic totalPrice(){
     return (counter* double.parse(widget.model.oneDayPrice!));
  }

  Future<Future<bool?>> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }



  Future<bool?> _storeFile(String url, List<int> bytes) async {
  var status = await Permission.storage.status;
    try {
      if (status.isDenied) {
        await Permission.storage.request();
        Directory? directory;
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath + "/PDF_Download";
        directory = Directory(newPath);
        File saveFile = File(directory.path);
        if (kDebugMode) {
          print(saveFile.path);
        }
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        if (await directory.exists()) {
          await Dio().download(
            url,
            saveFile.path,
            onReceiveProgress: (received,total){
              debugPrint(received.toString());

            }
          );
          return true;
        }

      }
      else{
        debugPrint('Permission to download');
        Directory? directory;
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath + "/PDF_Download";
        directory = Directory(newPath);
        File saveFile = File(directory.path + '/latestFile');
        if (kDebugMode) {
          print(saveFile.path);
        }
        if (!await directory.exists()) {
          debugPrint("not exist");
          await directory.create();
          debugPrint(directory.exists().toString());
        }
        if (await directory.exists()) {
          debugPrint('dnbjkmjnhbjkjn');
          await Dio().download(
            url,
            saveFile.path,
              onReceiveProgress: (received,total){
                debugPrint(received.toString());

              }
          );
          debugPrint('d&&&&&&&&&&&&&');
          return true;
        }

      }


    } catch(e){

    }

  }
  //
  // Future openFile({ String? url, String? fileName}) async {
  //   await downloadFile(url: url, name: fileName!);
  //   // if (file == null) return;
  //   // print('Path: ${file.path}');
  //   //
  //   // OpenFile.open(file.path);
  //
  // }
  //
  // Future<File?> downloadFile( { String? url, String? name}) async{
  //    final appStorage = await getApplicationDocumentsDirectory();
  //    final file = File('${appStorage.path}/$name');
  //
  //    try {
  //      final response = await Dio().get(url!,
  //        options: Options(
  //            responseType: ResponseType.bytes,
  //            followRedirects: false,
  //            receiveTimeout: 0
  //        ),
  //      );
  //      final raf = file.openSync(mode: FileMode.write);
  //      raf.writeFromSync(response.data);
  //      await raf.close();
  //
  //      return file;
  //    } catch (e){
  //      return null;
  //    }
  // }






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
              controller: _address,
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




}

