
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
      body: SingleChildScrollView(
        child: FutureBuilder<GetProductAddedToCartModal?>(
            future: productToCart(GetProductAddedToCartModal()),
            builder: (context,snapshot){

              if (snapshot.hasData){
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder
                        (shrinkWrap: true,
                          itemCount: snapshot.data!.cart!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: 389.50,
                                  height: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x42000000),
                                        blurRadius: 3,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children:[
                                      Positioned(
                                        left: 18,
                                        top: 17,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
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
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 134,
                                        top: 25,
                                        child: Text(
                                          snapshot.data!.cart![index].product??"Name of Product",
                                          style: TextStyle(
                                            color: Color(0xff727171),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Rent - \$${snapshot.data!.cart![index].rent??"NA"}",
                                            style: TextStyle(
                                              color: Color(0xff0a0a0a),
                                              fontSize: 18,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        left: 176,
                                        top: 128,
                                        child: Container(
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

                                              Spacer(),
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
                                              Spacer(),
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
                                      ),

                                      Positioned(
                                        left: 21,
                                        top: 129,
                                        child: Container(
                                          width: 124,
                                          height: 26,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children:[
                                                  Text(
                                                    "Weekend special",
                                                    style: TextStyle(
                                                      color: Color(0xff5600d4),
                                                      fontSize: 14,
                                                      fontFamily: "Lato",
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 306,
                                        top: 129,
                                        child: Container(
                                          width: 62,
                                          height: 26,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(2),
                                            border: Border.all(color: Color(0xffcacaca), width: 1.20, ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 316,
                                        top: 133,
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
                                ),
                              ],

                            );
                          }),
                    ),
                    Column(


                      mainAxisAlignment: MainAxisAlignment.end,
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
                            mainAxisSize: MainAxisSize.min,
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
                  ],
                );
              }
              if (snapshot.hasError){
                return Center(child: Text('Something went wrong'));
              }
              return Center(child: CircularProgressIndicator());


            }

        ),
      ),

      );
  }
}