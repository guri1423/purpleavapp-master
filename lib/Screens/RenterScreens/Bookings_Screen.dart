
import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/renter_model/booking_model.dart';
import 'package:purpleavapp/Screens/RenterScreens/address_enter.dart';
import 'package:purpleavapp/Screens/RenterScreens/renter_review.dart';
import 'package:purpleavapp/Screens/service_provider/SignUp.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

class RenterBooking extends StatefulWidget {
  const RenterBooking({Key? key}) : super(key: key);

  @override
  State<RenterBooking> createState() => _RenterBookingState();
}

class _RenterBookingState extends State<RenterBooking> {
  int index=0;
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
                "Bookings",
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

      body: Column(
        children: [
          Container(
              width: 436,
              height: 63,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .5 - 1,
                            color: index == 0
                                ? Color(0xff5600d4)
                                : Colors.white,
                            child: Center(
                                child: Text(
                                  "Booking Received",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      color: index == 0
                                          ? Colors.white
                                          : Color(0xff5600d4)),
                                ))),
                        Container(
                            height: 5,
                            width: MediaQuery.of(context).size.width * .5 - 1,
                            color: index == 0
                                ? Color(0xff5600d4)
                                : Color(0xff727171))
                      ],
                    ),
                  ),
                  Container(
                    height: 46,
                    width: 2,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .5 - 1,
                            color: index == 1
                                ? Color(0xff5600d4)
                                : Colors.white,
                            child: Center(
                                child: Text(
                                  "Booking Closed",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      color: index == 1
                                          ? Colors.white
                                          : Color(0xff5600d4)),
                                ))),
                        Container(
                            height: 5,
                            width: MediaQuery.of(context).size.width * .5 - 1,
                            color: index == 1
                                ? Color(0xff5600d4)
                                : Color(0xff727171))
                      ],
                    ),
                  )
                ],
              )),

          index==0? SingleChildScrollView(
            child: FutureBuilder<BookingModel>(
              future: getBookingDetails('active'),
              builder: (context,snapshot){
                if(snapshot.hasData){

                  return SizedBox(
                    height: MediaQuery.of(context).size.height*0.68,
                    child: ListView.builder(
                        itemCount: snapshot.data!.bookings!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                width: 389.50,
                                height: 402,
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
                                      left: 287,
                                      top: 18,
                                      child: Container(
                                        width: 75.71,
                                        height: 71.50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Color(0xfff4f4f4),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26,
                                      top: 74,
                                      child: Text(
                                        "Rentee:  ${snapshot.data!.bookings![index].renter!.name}",
                                        style: TextStyle(
                                          color: Color(0xff727171),
                                          fontSize: 15,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26,
                                      top: 24,
                                      child: Text(
                                        snapshot.data!.bookings![index].product!.name!,
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 48,
                                      top: 179,
                                      child: Text(
                                        "Ordered",
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 48,
                                      top: 231,
                                      child: Text(
                                        "Delivered",
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 262,
                                      top: 368,
                                      child: GestureDetector( onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RenterReview()
                                        ));

                                      },
                                        child: Text(
                                          "Write a Review",
                                          style: TextStyle(
                                            color: Color(0xff458df9),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 48,
                                      top: 283,
                                      child: Text(
                                        "Return (Booking Close)",
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 300,
                                      top: 104,
                                      child: Text(
                                       '\$${snapshot.data!.bookings![index].totalPrice!} ',
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 16,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 49,
                                      top: 202,
                                      child: Text(
                                        snapshot.data!.bookings![index].startDate!.toString(),
                                        style: TextStyle(
                                          color: Color(0xff929292),
                                          fontSize: 12,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 49,
                                      top: 254,
                                      child: Text(
                                        "Your item has been deliverd on ${snapshot.data!.bookings![index].startDate!.toString()}",
                                        style: TextStyle(
                                          color: Color(0xff929292),
                                          fontSize: 12,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 49,
                                      top: 306,
                                      child: Text(
                                        snapshot.data!.bookings![index].endDate!.toString(),
                                        style: TextStyle(
                                          color: Color(0xff929292),
                                          fontSize: 12,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 297,
                                      top: 25.39,
                                      child: Container(
                                          width: 57,
                                          height: 57,
                                          child: Image.network('https://purpleapp.omkatech.com/${snapshot.data!.bookings![index].product!.productImages![0].url}')
                                      ),
                                    ),
                                    Positioned(
                                      left: 26,
                                      top: 106,
                                      child: Text(
                                        "5 June,2022",
                                        style: TextStyle(
                                          color: Color(0xff989898),
                                          fontSize: 14,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 23,
                                      top: 184,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff5600d4),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 23,
                                      top: 236,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff5600d4),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 23,
                                      top: 288,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffdbdbdb),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 59.50),

                            ],
                          );
                        }),
                  );
                }
                if(snapshot.hasError){
                  return Center(child: Text('Something went wrong'));
                }
                return Center(child: CircularProgressIndicator());
              },

            ),
          ): SingleChildScrollView(
            child: FutureBuilder<BookingModel>(
              future: getBookingDetails('closed'),
              builder: (context,snapshot){
                if(snapshot.hasData){

                  return SizedBox(
                    height: MediaQuery.of(context).size.height*0.68,
                    child: ListView.builder(
                        itemCount: snapshot.data!.bookings!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                width: 389.50,
                                height: 402,
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
                                      left: 287,
                                      top: 18,
                                      child: Container(
                                        width: 75.71,
                                        height: 71.50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Color(0xfff4f4f4),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26,
                                      top: 74,
                                      child: Text(
                                        "Rentee:  ${snapshot.data!.bookings![index].renter!.name}",
                                        style: TextStyle(
                                          color: Color(0xff727171),
                                          fontSize: 15,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 26,
                                      top: 24,
                                      child: Text(
                                        snapshot.data!.bookings![index].product!.name!,
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 48,
                                      top: 179,
                                      child: Text(
                                        "Ordered",
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 48,
                                      top: 231,
                                      child: Text(
                                        "Delivered",
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 262,
                                      top: 368,
                                      child: GestureDetector( onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RenterReview()
                                        ));

                                      },
                                        child: Text(
                                          "Write a Review",
                                          style: TextStyle(
                                            color: Color(0xff458df9),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 48,
                                      top: 283,
                                      child: Text(
                                        "Return (Booking Close)",
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 300,
                                      top: 104,
                                      child: Text(
                                        '\$${snapshot.data!.bookings![index].totalPrice!} ',
                                        style: TextStyle(
                                          color: Color(0xff2d2d2d),
                                          fontSize: 16,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 49,
                                      top: 202,
                                      child: Text(
                                        snapshot.data!.bookings![index].startDate!.toString(),
                                        style: TextStyle(
                                          color: Color(0xff929292),
                                          fontSize: 12,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 49,
                                      top: 254,
                                      child: Text(
                                        "Your item has been deliverd on ${snapshot.data!.bookings![index].startDate!.toString()}",
                                        style: TextStyle(
                                          color: Color(0xff929292),
                                          fontSize: 12,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 49,
                                      top: 306,
                                      child: Text(
                                        snapshot.data!.bookings![index].endDate!.toString(),
                                        style: TextStyle(
                                          color: Color(0xff929292),
                                          fontSize: 12,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 297,
                                      top: 25.39,
                                      child: Container(
                                          width: 57,
                                          height: 57,
                                          child: Image.network('https://purpleapp.omkatech.com/${snapshot.data!.bookings![index].product!.productImages![0].url}')
                                      ),
                                    ),
                                    Positioned(
                                      left: 26,
                                      top: 106,
                                      child: Text(
                                        "5 June,2022",
                                        style: TextStyle(
                                          color: Color(0xff989898),
                                          fontSize: 14,
                                          fontFamily: "Lato",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 23,
                                      top: 184,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff5600d4),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 23,
                                      top: 236,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff5600d4),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 23,
                                      top: 288,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffdbdbdb),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 59.50),

                            ],
                          );
                        }),
                  );
                }
                if(snapshot.hasError){
                  return Center(child: Text('Something went wrong'));
                }
                return Center(child: CircularProgressIndicator());
              },

            ),
          )
        ],
      ),




    );
  }
}

