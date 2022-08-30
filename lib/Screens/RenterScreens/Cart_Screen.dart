
import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/renter_model/get_product_in_cart_modal.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

class RenterCart extends StatefulWidget {
  const RenterCart({Key? key}) : super(key: key);

  @override
  State<RenterCart> createState() => _RenterCartState();
}



class _RenterCartState extends State<RenterCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff5600d4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(
                "Cart",
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
      body: FutureBuilder<GetProductAddedToCartModal?>(
          future: productToCart(),
          builder: (context,snapshot){

            if (snapshot.hasData){
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder
                          (shrinkWrap: true,
                            itemCount: snapshot.data!.cart!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:[
                                      Container(
                                        width: 90,
                                        height: 85,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Color(0xfff4f4f4),
                                        ),
                                        child: Container(
                                            width: 67.50,
                                            height: 67.50,
                                            child: Image.asset('images/cartimage.png')
                                        ),
                                      ),

                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Text(
                                          //   snapshot.data!.cart![index].product??"Name of Product",
                                          //   style: TextStyle(
                                          //     color: Color(0xff727171),
                                          //     fontSize: 15,
                                          //   ),
                                          // ),
                                          Spacer(),
                                          Text(
                                            "Rent - \$${snapshot.data!.cart![index].rent??"NA"}",
                                            style: TextStyle(
                                              color: Color(0xff0a0a0a),
                                              fontSize: 18,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                        width: 124,
                                        height: 26,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children:[
                                            Text(
                                              "TYPE OF RENT",
                                              style: TextStyle(
                                                color: Color(0xff5600d4),
                                                fontSize: 14,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(

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


                                          Text(
                                            snapshot.data!.cart![index].quantity?? "",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xff2d2d2d),
                                              fontSize: 18,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),

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

                                      Container(
                                        width: 62,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          border: Border.all(color: Color(0xffcacaca), width: 1.20, ),
                                        ),
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(
                                            color: Color(0xff6f6f6f),
                                            fontSize: 14,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],

                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Proceed to Payment (2 Items)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 11.60),


                                Row(
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(
                                        color: Color(0xff2d2d2d),
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$50.25",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff2d2d2d),
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 11.60),


                                Row(
                                  children: [
                                    Text(
                                      "Shipping Charge",
                                      style: TextStyle(
                                        color: Color(0xff2d2d2d),
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$5.00",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff2d2d2d),
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 11.60),



                                Row(
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                        color: Color(0xff2d2d2d),
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$55.25",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff2d2d2d),
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),



                          SizedBox(height: 11.60),
                          Container(
                            width: 363,
                            height: 50,
                            child: Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 363,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color(0xff5600d4),
                                  ),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:[
                                      Text(
                                        "Add Shipping Address",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 11.60),

                        ],
                      ),
                    ),

                  ],
                ),
              );
            }
            if (snapshot.hasError){
              return Center(child: Text('Something went wrong'));
            }
            return Center(child: CircularProgressIndicator());


          }

      ),

      );
  }
}