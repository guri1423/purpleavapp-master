
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:purpleavapp/Modal/renter_model/booking_model.dart';
import 'package:purpleavapp/Services/ApiServices.dart';


class ClosedBooking extends StatefulWidget {

  BookingServiceProvider modal;

  ClosedBooking({Key? key,
  required this.modal
  }) : super(key: key);

  @override
  State<ClosedBooking> createState() => _ClosedBookingState();
}

class _ClosedBookingState extends State<ClosedBooking> {

  DateTime returnDate= DateTime(2022,12,29);



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
      body: ListView.builder(itemCount: 1,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child:  Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(height: 20.28),
                            Text(
                                 'Total Price: \$${widget.modal.totalPrice!} ' ,
                              style: TextStyle(
                                color: Color(0xff2d2d2d),
                                fontSize: 18,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                          ],
                        ),
                        Spacer(),

                        SizedBox(
                          height: 200,
                            child: Image.network("https://purpleapp.omkatech.com/${widget.modal.product!.productImages![0].url}")),
                      ],
                    ),





                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: const Divider(
                        height: 50,
                        thickness: 2,
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                "Product :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),

                              Text(
                                "Brand :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),

                              Text(
                                "Model No :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),

                              Text(
                                "Rentee :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Quantity :",
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                 widget.modal.product!.name!,
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,

                                ),
                              ),

                              Text(
                                widget.modal.product!.brand!,
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),

                              Text(
                                widget.modal.product!.model!,
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),



                              Text(
                                widget.modal.renter!.name!,
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.modal.quantity!,
                                style: TextStyle(
                                  color: Color(0xff2d2d2d),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),


                    const Divider(
                      height: 50,
                      thickness: 2,
                    ),

                    ElevatedButton(onPressed: ()async{
                      DateTime? newReturnDate = await showDatePicker(context: context, initialDate: returnDate, firstDate: DateTime(2000) , lastDate: DateTime(2100));
                      if(newReturnDate == null) return;

                      setState(() {
                        returnDate = newReturnDate;
                      });
                    }, child: Center(child: Text('Return Date'))),



                    GestureDetector(
                      onTap: (){
                        updateBookingStatus(widget.modal.id!, returnDate.toString());

                      },
                      child: Container(
                        width: 363,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xff5600d4),
                        ),

                        child: Center(
                          child: Text(
                            "Close Booking",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
          }

      )
      

    );
  }
}
