



import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/get_booking_modal.dart';
import 'package:purpleavapp/Modal/renter_model/booking_model.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

class ClosedBooking extends StatefulWidget {
  const ClosedBooking({Key? key}) : super(key: key);

  @override
  State<ClosedBooking> createState() => _ClosedBookingState();
}

class _ClosedBookingState extends State<ClosedBooking> {
  late Future<BookingModel> _future;
  @override

  void initState() {
    _future = getAllBooking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xff5600d4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const[
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
      body: FutureBuilder<GetBookingModal>(
        future:getAllBookings(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data!.bookings.length,
                itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[

                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // Text(
                              //   snapshot.data!.bookings[index].equipmentName!,
                              //   style: TextStyle(
                              //     color: Color(0xff2d2d2d),
                              //     fontSize: 18,
                              //   ),
                              // ),
                              SizedBox(height: 20.28),
                              Text(
                                snapshot.data!.bookings[index].serviceProviderId!,
                                style: TextStyle(
                                  color: Color(0xff727171),
                                  fontSize: 15,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // SizedBox(height: 20,),
                              // SizedBox(
                              //   height: 50,
                              //   width: 150,
                              //   child: ListView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     physics: NeverScrollableScrollPhysics(),
                              //     itemCount: 5,
                              //     itemBuilder: (context, index){
                              //       return Icon(
                              //         Icons.star,
                              //         color: Colors.blueAccent,size: 30,);
                              //     },
                              //   ),
                              // )
                            ],
                          ),
                          Spacer(),

                          Image.asset("images/mic11.png")
                        ],
                      ),





                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: const Divider(
                          height: 50,
                          thickness: 2,
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:const [

                              Text(
                                "Product :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 41),
                              Text(
                                "Brand :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 20.28),
                              Text(
                                "Model No :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 20.28),
                              Text(
                                "Package :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 20.28),

                              SizedBox(height: 36),
                              Text(
                                "Rentee :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:const [

                              Text(
                                "Shure SV100 Multi-Purpose\nMicrophone",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,

                                ),
                              ),
                              SizedBox(height: 20.28),
                              Text(
                                "Shure ",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 20.28),
                              Text(
                                "SV100",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 20.28),
                              Text(
                                "Weekly Package",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 20.28),
                              Text(
                                "(1 June,2022 to 7 June, 2022 )",
                                style: TextStyle(
                                  color: Color(0xff989898),
                                  fontSize: 14,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.28),
                              Text(
                                "jhon Smith",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),


                      const Divider(
                        height: 50,
                        thickness: 2,
                      ),


                      SizedBox(height: 20.28),
                      Text(
                        snapshot.data!.bookings[index].quantity!,
                        style: TextStyle(
                          color: Color(0xff5600d4),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20.28),
                      Container(
                        width: 363,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xff5600d4),
                        ),

                        child: Center(
                          child: Text(
                            "Order Again",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
                }

            );
          }
          if (snapshot.hasError){
            return Center(child: Text('Something went wrong'));
          }
          return Center(child: CircularProgressIndicator());


        }
      )
      

    );
  }
}
