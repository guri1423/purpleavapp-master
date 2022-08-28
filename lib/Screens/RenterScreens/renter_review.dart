import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';
import 'package:purpleavapp/main.dart';

class RenterReview extends StatefulWidget {
  const RenterReview({Key? key}) : super(key: key);

  @override
  State<RenterReview> createState() => _RenterReviewState();
}

class _RenterReviewState extends State<RenterReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(



        backgroundColor: Color(0xff5600d4),
        title: Row(
          children: [


            Text('Reviews(10)',
            ),
            Spacer(),
          ],
        ),
      ),

      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(radius: 25,),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text(
                                  "Katoka Smith",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "8 May 2022",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.w300,
                              ),
                            ),

                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 70, right: 10),
                          child: Expanded(
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printingand  typesetting industry. Lorem Ipsum has been theindustry's standard dummy text ever since the 1500s,",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Lato",

                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            );

          }

      ),
    );
  }
}
