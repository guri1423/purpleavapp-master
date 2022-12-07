import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/get_booking_modal.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/booking_details_serviceprovider.dart';
import 'package:purpleavapp/Services/ApiServices.dart';
import 'package:purpleavapp/main.dart';

import '../../Modal/renter_model/booking_model.dart';
import 'active_booking_details.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int index = 0;
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
          )),
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
         index==0? FutureBuilder<BookingModel>(
              future:getBookingDetails('active'),
              builder: (context,snapshot){
                if (snapshot.hasData){
                  return SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.67,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.bookings!.length,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 170,
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
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [


                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total price: ${snapshot.data!.bookings![index].totalPrice!} ',
                                              style: TextStyle(
                                                color: Color(0xff727171),
                                                fontSize: 15,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                                'Quantity: ${snapshot.data!.bookings![index].quantity!}',
                                              style: TextStyle(
                                                color: Color(0xff727171),
                                                fontSize: 15,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "Payment Completed ",
                                              style: TextStyle(
                                                color: Color(0xff0a0a0a),
                                                fontSize: 18,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 75.71,
                                          height: 71.50,
                                          child: Container(
                                            width: 75.71,
                                            height: 71.50,
                                            child: Image.network("https://purpleapp.omkatech.com/${snapshot.data!.bookings![index].product!.productImages![0].url}"),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  7),
                                              color: Color(0xfff4f4f4),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ClosedBooking(modal: snapshot.data!.bookings![index],)));
                                    },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          border: Border.all(
                                            color: Color(0xff5600d4),
                                            width: 1.20,
                                          ),
                                        ),
                                        child: Center(
                                          child:  Text(
                                            "View Details",
                                            style: TextStyle(
                                              color: Color(0xff5600d4),
                                              fontSize: 16,
                                              fontFamily: "Lato",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                              ),
                            );
                          }),
                    ),
                  );
                }
                if (snapshot.hasError){
                  return Center(child: Text('Something went wrong'));
                }
                return Center(child: CircularProgressIndicator());


              }



      ):FutureBuilder<BookingModel>(
             future:getBookingDetails('closed'),
             builder: (context,snapshot){
               if (snapshot.hasData){
                 return SingleChildScrollView(
                   child: SizedBox(
                     height: MediaQuery.of(context).size.height*0.67,
                     child: ListView.builder(
                         shrinkWrap: true,
                         physics: ScrollPhysics(),
                         itemCount: snapshot.data!.bookings!.length,
                         itemBuilder: (context, index) {
                           return  Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               width: MediaQuery.of(context).size.width,
                               height: 170,
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
                               padding: EdgeInsets.all(20),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [


                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(
                                             'Total price: ${snapshot.data!.bookings![index].totalPrice!} ',
                                             style: TextStyle(
                                               color: Color(0xff727171),
                                               fontSize: 15,
                                               fontFamily: "Lato",
                                               fontWeight: FontWeight.w700,
                                             ),
                                           ),
                                           Text(
                                             'Quantity: ${snapshot.data!.bookings![index].quantity!}',
                                             style: TextStyle(
                                               color: Color(0xff727171),
                                               fontSize: 15,
                                               fontFamily: "Lato",
                                               fontWeight: FontWeight.w700,
                                             ),
                                           ),
                                           Text(
                                             "Payment Completed ",
                                             style: TextStyle(
                                               color: Color(0xff0a0a0a),
                                               fontSize: 18,
                                               fontFamily: "Lato",
                                               fontWeight: FontWeight.w700,
                                             ),
                                           ),
                                         ],
                                       ),
                                       Spacer(),
                                       Container(
                                         width: 75.71,
                                         height: 71.50,
                                         child: Container(
                                           width: 75.71,
                                           height: 71.50,
                                           child: Image.network("https://purpleapp.omkatech.com/${snapshot.data!.bookings![index].product!.productImages![0].url}"),
                                           decoration: BoxDecoration(
                                             borderRadius:
                                             BorderRadius.circular(
                                                 7),
                                             color: Color(0xfff4f4f4),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                   Spacer(),
                                   GestureDetector( onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> ActiveBooking(modal: snapshot.data!.bookings![index],)));
                                   },
                                     child: Container(
                                       width: MediaQuery.of(context).size.width,
                                       height: 32,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(3),
                                         border: Border.all(
                                           color: Color(0xff5600d4),
                                           width: 1.20,
                                         ),
                                       ),
                                       child: Center(
                                         child:  Text(
                                           "View Details",
                                           style: TextStyle(
                                             color: Color(0xff5600d4),
                                             fontSize: 16,
                                             fontFamily: "Lato",
                                             fontWeight: FontWeight.w600,
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),

                                 ],
                               ),

                             ),
                           );
                         }),
                   ),
                 );
               }
               if (snapshot.hasError){
                 return Center(child: Text('Something went wrong'));
               }
               return Center(child: CircularProgressIndicator());


             }



         )


        ],
      ),
    );
  }
}
