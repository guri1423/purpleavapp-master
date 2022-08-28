import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:purpleavapp/Modal/review_modal.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';
import 'package:purpleavapp/Services/ApiServices.dart';
import 'package:purpleavapp/main.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}


class _ReviewState extends State<Review> {
  late Future<ReviewModel> _future;
  @override

  void initState() {
    _future = getAllReviews();
    super.initState();
  }
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

      body: FutureBuilder<ReviewModel>(
        future: _future,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.review.length,
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
                                  Flexible(
                                    child: Text(
                                      snapshot.data!.review[index].review!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                   convertDate(snapshot.data!.review[index].createdAt!) ,
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
                                    "",
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

            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text("something went wrong"),
            );
          }
          return Center(child: CircularProgressIndicator());

        },
      ),
    );
  }
}



String convertDate(DateTime dateTime){
  DateFormat dateFormat = DateFormat.yMMMd();
  return dateFormat.format(dateTime);
}