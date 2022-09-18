import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/post_product_model.dart';
import 'package:purpleavapp/Modal/renter_model/product_model.dart';
import 'package:purpleavapp/Screens/RenterScreens/product_details.dart';
import 'package:purpleavapp/Screens/service_provider/Add_Products.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';
import 'package:purpleavapp/Screens/service_provider/product_details_serviceprovider.dart';
import 'package:purpleavapp/Screens/service_provider/review.dart';
import 'package:purpleavapp/Services/ApiServices.dart';
import 'package:purpleavapp/main.dart';

import '../../Modal/get_product_modal.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {


  int? productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,



        backgroundColor: Color(0xff5600d4),
        title: Row(
          children: [


            Text('My Products',
            ),
        Spacer(),
        GestureDetector( onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Review()));


        },
          child: Column(
            children: [
              Icon(
                Icons.star,
                color: Colors.white,
                size: 25,
              ),
              Text('Reviews',
               style: TextStyle(
                  color: Colors.white,
                 fontSize: 15,
                 fontFamily: "Lato",
                  ),
              )
            ],
          ),
        )
          ],
        ),
      ),

      body: FutureBuilder<GetProductsModal>(
        future: getAllProducts(),
        builder: (context,snapshot){
          if (snapshot.hasData){

            if(snapshot.data!.products.isEmpty){
              return Center(child: Text("No Product Added!"));
            }else{
              return ListView.builder(
                  itemCount: snapshot.data!.products.length,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x42000000),
                              blurRadius: 6,
                              offset: Offset(0, 0),
                            ),
                          ],
                          color: Colors.white,
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ProductDetailsRenter(model: snapshot.data!.products[index],)));
                                },
                                child: Container(
                                  // height:144,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Color(0xfff4f4f4),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                    Image.network("https://purpleapp.omkatech.com/${snapshot.data!.products[index].productImages![0]["url"]}")

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(onTap:(){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => ProductDetailsRenter(model: snapshot.data!.products[index],)));

                                    },
                                      child: Text(
                                        snapshot.data!.products[index].name!,
                                        style: TextStyle(
                                          color: Color(0xff727171),
                                          fontSize: 18,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      'Rent -\$ ${snapshot.data!.products[index].oneDayPrice} per day',
                                      style: TextStyle(
                                        color: Color(0xff0a0a0a),
                                        fontSize: 18,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        Container(
                                          width: 86,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            border: Border.all(color: Color(0xff3d77f0), width: 1.20, ),
                                          ),
                                          child: Center(
                                            child: GestureDetector( onTap: (){
                                              showDialog(context: context,
                                                  builder:(BuildContext context){
                                                    return Dialog (
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: Container(
                                                            width: 378,
                                                            height: 211,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: Colors.white,
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  SizedBox(height: 30,),
                                                                  Text(
                                                                    "Are you sure you want to \nremove it?",
                                                                    style: TextStyle(
                                                                      color: Color(0xff2d2d2d),
                                                                      fontSize: 20,
                                                                      fontFamily: "Lato",
                                                                      fontWeight: FontWeight.w700,
                                                                    ),
                                                                  ),
                                                                  SizedBox(height: 20,),
                                                                  SizedBox(height: 20,),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children:[
                                                                      GestureDetector(onTap: (){
                                                                        productId = snapshot.data!.products[index].id;
                                                                        deleteProduct(productId!);
                                                                        Navigator.pop(context);
                                                                        setState(() {
                                                                          getAllProducts();
                                                                        });
                                                                      },
                                                                        child: Container(
                                                                          width: 132.39,
                                                                          height: 38,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: Color(0xff5600d4),
                                                                          ),
                                                                          child: SizedBox(
                                                                            width: 57.61,
                                                                            height: 20.84,
                                                                            child: Center(
                                                                              child: Text(
                                                                                "Yes",
                                                                                style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 16,
                                                                                  fontFamily: "Lato",
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 15,),
                                                                      GestureDetector(
                                                                        onTap: (){
                                                                          Navigator.pop(context);
                                                                        },
                                                                        child: Container(
                                                                          width: 132.39,
                                                                          height: 38,
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(4),
                                                                            color: Color(0xff5600d4),
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              "No",
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 16,
                                                                                fontFamily: "Lato",
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            )



                                                        )

                                                    );

                                                  }
                                              );
                                            },
                                              child: Text(
                                                "Remove",
                                                style: TextStyle(
                                                  color: Color(0xff3d77f0),
                                                  fontSize: 14,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 25,),
                                        GestureDetector(   onTap: (){
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => ProductDetailsRenter(model: snapshot.data!.products[index],)));
                                        },
                                          child: Container(
                                            width: 64,
                                            height: 26,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3),
                                              border: Border.all(color: Color(0xff3d77f0), width: 1.20, ),
                                            ),

                                            child: Center(
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                  color: Color(0xff0153fe),
                                                  fontSize: 14,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),



                                      ],
                                    )


                                  ],
                                ),
                              )


                            ],
                          ),
                        ),
                      ),
                    );

                  }

              );
            }
          }

          if (snapshot.hasError){
            return Center(child: Text('Something went wrong'));
          }
          return Center(child: CircularProgressIndicator());
        },

      ),










    );
  }
}
