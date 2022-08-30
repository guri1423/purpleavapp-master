
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purpleavapp/Modal/renter_model/add_to_cart_modal.dart';
import 'package:purpleavapp/Modal/renter_model/category_search_modal.dart';
import 'package:purpleavapp/Screens/RenterScreens/Cart_Screen.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

import '../../Modal/renter_model/product_model.dart';
import '../../Modal/renter_model/search_modal.dart';

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
                child: Image.asset('images/pic1.png'),
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
                     child: Image.asset("images/pic2.png"),
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
                widget.model.oneDayPrice!,
                style: TextStyle(
                  color: Color(0xff5600d4),
                  fontSize: 22,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 364,
                height: 115,
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
                "Brand: \$${widget.model.brand}\n"
                    "Model: \$${widget.model.model}",
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
              Text("description",
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
                width: 365,
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
                      width: 100,
                      height: 28,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Container(
                            width: 34,
                            height: 28,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffcacaca), width: 1, ),
                              color: Color(0xffeaeaea),
                            ),
                            child: Icon(Icons.remove),

                          ),

                          SizedBox(width: 10.50),
                          Text(
                            "1",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff2d2d2d),
                              fontSize: 18,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10.50),
                          Container(
                            width: 34,
                            height: 28,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffcacaca), width: 1, ),
                              color: Color(0xffeaeaea),
                            ),
                            child: Icon(Icons.add),


                          ),
                        ],
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
                width: 365,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                  color: Color(0xfff0f0f0),
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
                        value: value1, onChanged: (value) {
                      value1 = !value1;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "Three day Rental Price",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                        "\$${widget.model.twoDayPrice}",
                      style: TextStyle(
                        color: Color(0xff5600d4),
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
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
                        value: value2, onChanged: (value) {
                      value2 = !value2;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "Weekend Special",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$${widget.model.weekendPrice}",
                      style: TextStyle(
                        color: Color(0xff5600d4),
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
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
                        value: value3, onChanged: (value) {
                      value3 = !value3;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "One day Price",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "per day price",
                      style: TextStyle(
                        color: Color(0xff5600d4),
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
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
                        value: value4, onChanged: (value) {
                      value4 = !value4;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "Two day Rental Price",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                        "\$${widget.model.twoDayPrice}",
                      style: TextStyle(
                        color: Color(0xff5600d4),
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
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
                        value: value5, onChanged: (value) {
                      value5 = !value5;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "Three day Rental Price",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$${widget.model.twoDayPrice}",
                      style: TextStyle(
                        color: Color(0xff5600d4),
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
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
                        value: value6, onChanged: (value) {
                      value6 = !value6;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "Weekly Rental Price",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$${widget.model.weeklyPrice}",
                      style: TextStyle(
                        color: Color(0xff5600d4),
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
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
                        value: value7, onChanged: (value) {
                      value7 = !value7;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "Package 1",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                    "\$${widget.model.package1}",
                      style: TextStyle(
                        color: Color(0xff5600d4),
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
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
                        value: value8, onChanged: (value) {
                      value8 = !value8;
                      setState(() {

                      });
                    }),
                    SizedBox(width: 40),
                    Text(
                      "Package 2",
                      style: TextStyle(
                        color: Color(0xff2d2d2d),
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$${widget.model.package1}",
                      style: TextStyle(
                        color: Color(0xff5600d4),
                        fontSize: 18,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
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
                      value10 = !value10;
                      setState(() {

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
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  bool? status = await productAddToCart(ProductCart(
                    productId:widget.model.id.toString() ,
                    quantity:"1" ,
                    rent: rentType(),
                    rentPrice:rentPrice() ,
                    package: packageType(),
                    packagePrice: packagePrice(),
                    delivery: deliveryMethod(),


                  ));
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
    if(value1 == true){
      return widget.model.threeDayPrice!;
    }else if(value2 == true){
      return widget.model.weekendPrice!;
    }else if(value3 == true){
      return widget.model.oneDayPrice!;
    }else if(value4 == true){
      return widget.model.twoDayPrice!;
    }else if(value5 == true){
      return widget.model.threeDayPrice!;
    }else if(value6 == true){
      return widget.model.weeklyPrice!;
    }else{
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
  String packagePrice(){
    if(value7 == true){
      return widget.model.package1Price!;
    }else if(value8 == true){
      return widget.model.package2Price!;
    }else{
      return widget.model.package1Price!;
    }
  }




}
