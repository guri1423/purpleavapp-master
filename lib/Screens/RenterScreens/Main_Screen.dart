import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/service_provider/Add_Products.dart';
import 'package:purpleavapp/Screens/service_provider/Bookings.dart';
import 'package:purpleavapp/Screens/service_provider/Contact_us.dart';
import 'package:purpleavapp/Screens/service_provider/My_Account.dart';
import 'package:purpleavapp/Screens/service_provider/My_Products.dart';
import 'package:purpleavapp/Screens/service_provider/Personal_Details.dart';
import 'package:purpleavapp/Screens/RenterScreens/Bookings_Screen.dart';
import 'package:purpleavapp/Screens/RenterScreens/Cart_Screen.dart';
import 'package:purpleavapp/Screens/RenterScreens/Home_Screen.dart';
import 'package:purpleavapp/Screens/RenterScreens/MyAccount_Screen.dart';
import 'package:purpleavapp/Screens/service_provider/Transactions.dart';
import 'package:purpleavapp/Screens/service_provider/logout.dart';

class Renter_Home extends StatefulWidget {
  const Renter_Home({Key? key}) : super(key: key);

  @override
  State<Renter_Home> createState() => _Renter_HomeState();
}


List<Widget>_body=[
  RenterHome(),
  RenterBooking(),
  RenterCart(),
  MyAccountRenter(),


];
int selectindex=0;



class _Renter_HomeState extends State<Renter_Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 5,
              shadowColor: Colors.white,
              child: Container(height: 220,
                width:  MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:  MediaQuery.of(context).padding.top),
                      CircleAvatar(
                        radius: 40,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("User Name"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text("username123@gmail.com"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => PersonalDetails()));
                    },
                    child: Container(
                      child: Row(
                        children:const [
                          Icon(Icons.person_outline,color: Colors.black,size: 20,),
                          SizedBox(width: 15,),
                          Text("Personal Details"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => Transaction()));
                    },
                    child: Container(
                      child: Row(
                        children:const [
                          Icon(Icons.access_time ,color: Colors.black,size: 20,),
                          SizedBox(width: 15,),
                          Text("Transaction"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector( onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Contactus()));
                  },
                    child: Container(
                      child: Row(
                        children:const [
                          Icon(Icons.phone,color: Colors.black,size: 20,),
                          SizedBox(width: 15,),
                          Text("Contact Us"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector( onTap: (){
                    Navigator.pop(context);
                    showDialog(context: context,
                        builder:(BuildContext context){
                          return Dialog(
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
                                      children: [
                                        Container(
                                          width: 378,
                                          height: 52,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                                            color: Color(0xffe40613),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Warning",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Text(
                                          "Your will permanently lose all your reviews,\ntransaction history and profile info. ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff858585),
                                            fontSize: 14,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 40,),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children:[
                                            Container(
                                              width: 132.39,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Color(0xffb3b3b3),
                                              ),
                                              child: GestureDetector(
                                                onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(
                                                      builder: (context) => Renter_Home()));
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Cancel",
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
                                            Spacer(),
                                            Container(
                                              width: 132.39,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Color(0xffe40613),
                                              ),

                                              child: Center(
                                                child: GestureDetector(onTap: (){
                                                  Navigator.push(context, MaterialPageRoute(
                                                      builder: (context) => Logout()));
                                                },
                                                  child: Text(
                                                    "Confirm",
                                                    textAlign: TextAlign.center,
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

                                          ],
                                        ),
                                      ],
                                    ),
                                  )



                              )

                          );

                        }
                    );

                  },
                    child: Container(
                      child: Row(
                        children: const[
                          Icon(Icons.logout,color: Colors.black,size: 20,),
                          SizedBox(width: 15,),
                          Text("Logout"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 40,
                  onPressed: (){
                    setState(() {
                      selectindex=0;
                    });
                  }, icon: ImageIcon(AssetImage("images/homerenter.png",),
                  color: selectindex==0? Color(0xff5600d4):Color(0xff6f6f6f),
                ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: (){
                    setState(() {
                      selectindex=1;
                    });
                  }, icon: ImageIcon(AssetImage("images/Bookingrenter.png",),
                  color: selectindex==1? Color(0xff5600d4):Color(0xff6f6f6f),),),
                IconButton(
                  iconSize: 40,
                  onPressed: (){
                    setState(() {
                      selectindex=2;
                    });
                  }, icon: ImageIcon(AssetImage("images/cartrenter.png",),
                  color: selectindex==2? Color(0xff5600d4):Color(0xff6f6f6f),),),
                IconButton(
                  iconSize: 40,
                  onPressed: (){
                    setState(() {
                      selectindex=3;
                    });
                  }, icon: ImageIcon(AssetImage("images/rentermyaccount.png",),
                  color: selectindex==3? Color(0xff5600d4):Color(0xff6f6f6f),),),




              ],
            ),
          ),

        ),
      ),
      body: _body[selectindex],

    );
  }
}

