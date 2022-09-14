

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purpleavapp/Modal/chose_rent_model.dart';
import 'package:purpleavapp/Modal/edit_product_modal.dart';
import 'package:purpleavapp/Modal/get_product_modal.dart';
import 'package:purpleavapp/Screens/service_provider/My_Products.dart';

import '../../Services/ApiServices.dart';
import '../../Services/storage_services.dart';
import '../../Widgets/image_widgets.dart';
import 'package:http/http.dart' as http;

final StorageServices _services = StorageServices();


class ProductDetailsRenter extends StatefulWidget {

Product model;




  ProductDetailsRenter({Key? key,
    required this.model


  }) : super(key: key);

  @override
  State<ProductDetailsRenter> createState() => _ProductDetailsRenterState();
}

class _ProductDetailsRenterState extends State<ProductDetailsRenter> {

  @override
  void initState() {
    productId = widget.model.id;
   _equipment= TextEditingController(text: widget.model.name);
   _model = TextEditingController(text: widget.model.model);
   _brand= TextEditingController(text: widget.model.brand);
   _inventory= TextEditingController(text: widget.model.inventory);
   _weekendPrice= TextEditingController(text: widget.model.weekendPrice);
   _oneDayPrice= TextEditingController(text: widget.model.oneDayPrice);
   _twoDayPrice= TextEditingController(text: widget.model.twoDayPrice);
   _threeDayPrice= TextEditingController(text: widget.model.threeDayPrice);
   _weeklyPrice= TextEditingController(text: widget.model.weeklyPrice);
   _package1= TextEditingController(text: widget.model.package1);
   _package2= TextEditingController(text: widget.model.package2);
   _package1Price= TextEditingController(text: widget.model.package1Price);
   _package2Price= TextEditingController(text: widget.model.package2Price);
    super.initState();
  }


  final List<bool> _selected = List.generate(RentOptionsModel.list.length, (i) => false);
  final List<bool> _selectedPackage = List.generate(RentPackageModel.list.length, (i) => false);
  final List<bool> _selectedDelivery = List.generate(RentDeliveryModel.list.length, (i) => false);

  bool editProduct = true;

  TextEditingController _equipment = TextEditingController();
   TextEditingController _model = TextEditingController();
   TextEditingController _brand = TextEditingController();
   TextEditingController _category = TextEditingController();
  TextEditingController _shippingPrice = TextEditingController();
  TextEditingController _weekendPrice = TextEditingController();
   TextEditingController _oneDayPrice = TextEditingController();
  TextEditingController _twoDayPrice = TextEditingController();
  TextEditingController _threeDayPrice = TextEditingController();
  TextEditingController _weeklyPrice = TextEditingController();
 TextEditingController _package1 = TextEditingController();
   TextEditingController _package2 = TextEditingController();
 TextEditingController _package1Price = TextEditingController();
   TextEditingController _package2Price = TextEditingController();
 TextEditingController _inventory = TextEditingController();
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



  get DelegatingStream => null;



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
  
  
  int? productId;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xff5600d4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:const [
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: editProduct?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Image.network("https://purpleapp.omkatech.com/${widget.model.productImages![0]["url"]}"),
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
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index)=> Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      child: Image.network("https://purpleapp.omkatech.com/${widget.model.productImages![0]["url"]}"),
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xfff4f4f4),
                      ),
                    ),
                  ),),
              ),

              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  boxShadow:const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Stack(
                  children:[
                    Positioned(
                      left: 38,
                      top: 22,
                      child: Text(
                        "Renter Review",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 38,
                      top: 70,
                      child: Container(
                        width: 157.42,
                        height: 22.42,
                        child: Stack(
                          children:[],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 217,
                      top: 26,
                      child: Text(
                        "(31 Reviews)",
                        style: TextStyle(
                          color: Color(0xff6f6f6f),
                          fontSize: 16,
                          fontFamily: "Lato",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 217,
                      top: 75,
                      child: Text(
                        "4 out of 5",
                        style: TextStyle(
                          color: Color(0xff2d2d2d),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Name: ${widget.model.name!}",
                style: TextStyle(
                  color: Color(0xff2d2d2d),
                  fontSize: 22,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Text("One Day Price: \$${widget.model.oneDayPrice!}",
                style: TextStyle(
                  color: Color(0xff5600d4),
                  fontSize: 22,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
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
              Text("Model: ${widget.model.model}",
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
              Text(
                widget.model.moreInfo!,
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
              Container(
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
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                  color: Color(0xff5600d4),
                ),
              ),
              SizedBox(height: 10,),
              Container(

                height: 28,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:const[
                    Text(
                      "Quantity:  1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Choose Rent Options",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                width:  MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                  color: Color(0xfff0f0f0),
                ),
              ),
              SizedBox(height: 10,),
              // SizedBox(
              //   height: 300,
              //   width: MediaQuery.of(context).size.width,
              //   child: ListView.builder(
              //     itemCount: RentOptionsModel.list.length,
              //       physics: NeverScrollableScrollPhysics(),
              //       itemBuilder:(context,index){
              //       return Row(
              //         children: [
              //
              //           Text(RentOptionsModel.list[index].title,  style: TextStyle(
              //         color: Color(0xff2d2d2d),
              //         fontSize: 16,
              //         fontFamily: "Lato",
              //         fontWeight: FontWeight.w500,
              //       ),),
              //           Spacer(),
              //           Text(widget.model.threeDayPrice!),
              //         ],
              //       );
              //       }),
              // ),

              SizedBox(height: 5,),
              Container(

                height: 28,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      "Weekend Special",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(widget.model.weekendPrice!),

                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(

                height: 28,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      "One day Price",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(widget.model.oneDayPrice!),

                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(

                height: 28,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      "Two day Rental Price",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(widget.model.twoDayPrice!),

                  ],
                ),
              ),
              SizedBox(height: 5,),
              Container(

                height: 28,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(
                      "Three day Rental Price",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(widget.model.threeDayPrice!),

                  ],
                ),
              ),

              SizedBox(height: 5,),

              SizedBox(height: 10,),
              Text(
                "Packages",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount:RentPackageModel.list.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder:(context,index){
                      return Row(
                        children: [

                          Text(RentPackageModel.list[index].title,  style: TextStyle(
                            color: Color(0xff2d2d2d),
                            fontSize: 16,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                          ),),
                          Text("")
                        ],
                      );
                    }),
              ),
              SizedBox(height: 10,),
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
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount:RentDeliveryModel.list.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder:(context,index){
                      return Row(
                        children: [

                          Text(RentDeliveryModel.list[index].title,  style: TextStyle(
                            color: Color(0xff2d2d2d),
                            fontSize: 16,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                          ),)
                        ],
                      );
                    }),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    editProduct = false;
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
                        "Edit Product",
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
              // Container(
              //   alignment: Alignment.center,
              //   width: 363,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4),
              //     color: Color(0xff5600d4),
              //   ),
              //   child: Text(
              //     "Add to Cart",
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 20,
              //       fontFamily: "Lato",
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              // )




            ],
          ):
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  width: 15,
                ),
                Text("Weekend Special",
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
                  width: 15,
                ),
                Text("One day Price",
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
                  width: 15,
                ),
                Text("Two day Rental Price",
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
                  width: 15,
                ),
                Text("Three day Rental Price",
                  style: TextStyle(
                      fontSize: 15
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
                  width: 15,
                ),
                Text("Weekly Rental Price",
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
            SizedBox(height: 30,),



            /// here I have imported my custom dropdown
            /// just change list content name

            GestureDetector(
              onTap: () {

                print(_equipment.text);
                print(productId);
                print(_brand.text);
                print(_model.text);
                print(_weekendPrice.text);
                print(_oneDayPrice.text);
                print(_threeDayPrice.text);
                print(_package1Price.text);
                print(_package1.text);
                print(_package2Price.text);
                print(_package2.text);

                editAllProduct(
                    EditProduct(
                        weekendPrice: _weekendPrice.text, brand: _brand.text, model: _model.text,
                    name: _equipment.text, oneDayPrice: _oneDayPrice.text, threeDayPrice: _threeDayPrice.text, package1:_package1.text,
                  package1Price: _package1Price.text, twoDayPrice: _twoDayPrice.text, inventory: _inventory.text,
                    package2Price: _package2Price.text, weeklyPrice: _weekendPrice.text, package2: _package2.text ,
                        categoryId:categoryChange(selectedItem!), landmark: widget.model.pickupAddress!.landmark,
                        address:widget.model.pickupAddress!.address ,state:widget.model.pickupAddress!.state,city:widget.model.pickupAddress!.city
                        ,country:widget.model.pickupAddress!.country ,postalCode: widget.model.pickupAddress!.postalCode, moreInfo:widget.model.moreInfo, shippingCost: widget.model.shippingCost, termsConditions: widget.model.termsConditions, delivery: widget.model.delivery ??""
                    ),
                    productId!,);

                

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
        )
        ),
      ),





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

    var multipartFile= http.MultipartFile('images[]', stream, length,filename: _image1.path);
    request.files.add(multipartFile);
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





