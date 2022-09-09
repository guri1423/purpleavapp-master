
import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/renter_model/book_product_from_cart.dart';
import 'package:purpleavapp/Modal/renter_model/get_product_in_cart_modal.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

class RenterCart extends StatefulWidget {
  const RenterCart({Key? key}) : super(key: key);

  @override
  State<RenterCart> createState() => _RenterCartState();
}



class _RenterCartState extends State<RenterCart> {
  late int id;

  List chunk(List list,int chunkSize){
    List chunks=[];
    int len = list.length;
    for (var i=0; i<len;i+=chunkSize){
      int size= i+chunkSize;
      chunks.add(list.sublist(i,size>len?len:size));

    }
    return  chunks;
  }



  List<String> productId= [

  ];


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
                            itemBuilder: (context, index)
                            {
                              productId.add(snapshot.data!.cart![index].productId.toString());
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xfff4f4f4),),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                Text(
                                    snapshot.data!.cart![index].product!.name??"NA",
                                                  style: TextStyle(
                                                    color: Color(0xff727171),
                                                    fontSize: 15,
                                                  ),
                                                ),

                                                Text(
                                                  "Rent - \$${snapshot.data!.cart![index].rentPrice??"NA"}",
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
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 124,
                                              height: 26,
                                              child: Row(

                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.center,

                                                children:[
                                                  Text(
                                              snapshot.data!.cart![index].rent!,
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

                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children:[
                                                SizedBox(width: 5,),


                                                Text(
                                                  'Quantity- ${snapshot.data!.cart![index].quantity}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xff2d2d2d),
                                                    fontSize: 18,
                                                    fontFamily: "Roboto",
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(width: 5,),

                                                // Container(
                                                //   width: 34,
                                                //   height: 28,
                                                //   decoration: BoxDecoration(
                                                //     border: Border.all(color: Color(0xffcacaca), width: 1, ),
                                                //     color: Color(0xffeaeaea),
                                                //   ),
                                                //   child: Icon(Icons.add),
                                                //
                                                //
                                                // ),
                                              ],
                                            ),

                                            GestureDetector(
                                              onTap: (){
                                                id= snapshot.data!.cart![index].id!;
                                                deleteFromCart(id);
                                              },

                                              child: Container(
                                                width: 62,
                                                height: 26,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(2),
                                                  border: Border.all(color: Color(0xffcacaca), width: 1.20, ),
                                                ),
                                                child: Center(
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
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],

                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Spacer(),
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
                                      "\$110.00",
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
                                      "\$115.00",
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
                          GestureDetector(
                            onTap: (){
                              debugPrint("add booking pressed");
                             debugPrint(chunk(productId, 1).toString());

                             // deleteWholeCart();

                              postAllBookings(BookCart(
                               id: productId.toString(),
                             ));
                            },
                            child: Container(
                              width: 363,
                              height: 50,
                              child: Container(
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
                                      "Proceed to Payment",
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