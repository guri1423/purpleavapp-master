import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/service_provider/My_Account.dart';
import 'package:purpleavapp/Screens/RenterScreens/Main_Screen.dart';
import 'package:purpleavapp/Screens/RenterScreens/MyAccount_Screen.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';

class LogoutRenter extends StatefulWidget {
  const LogoutRenter({Key? key}) : super(key: key);

  @override
  State<LogoutRenter> createState() => _LogoutRenterState();
}

class _LogoutRenterState extends State<LogoutRenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff5600d4),
        title: Row(
          children: [
            GestureDetector( onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Renter_Home()));
            },

                child: Icon(Icons.arrow_back_ios)),
            Text('Logout',

            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Text(
              "Reason of Logout the account.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: "Lato",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Can you please share to us what was an issue? we  will fix bugs as soon as possible",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Lato",
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffb0b0b0), width: 1, ),
                  ),
                ),
                SizedBox(width: 21),
                Text(
                  "Change email Id",
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 18,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffb0b0b0), width: 1, ),
                  ),
                ),
                SizedBox(width: 21),
                Text(
                  "I’m not Getting any orders.",
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 18,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffb0b0b0), width: 1, ),
                  ),
                ),
                SizedBox(width: 21),
                Text(
                  "Contact us",
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 18,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffb0b0b0), width: 1, ),
                  ),
                ),
                SizedBox(width: 21),
                Text(
                  "Other",
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 18,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: 363,
              height: 228,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                color: Colors.white,
              ),

              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Your explaination is entirely optional...",
                  hintStyle: TextStyle(
                    color: Color(0xffb9b9b9),
                    fontSize: 16,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector( onTap: (){
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
                                    SizedBox(height: 30,),
                                    Text(
                                      "Are You Sure?",
                                      style: TextStyle(
                                        color: Color(0xff2d2d2d),
                                        fontSize: 20,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                      "Do your really want to Logout",
                                      style: TextStyle(
                                        color: Color(0xff858585),
                                        fontSize: 14,
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 20,),
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
                                          child: GestureDetector(onTap: (){
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => MyAccount()));
                                          },
                                            child: SizedBox(
                                              width: 57.61,
                                              height: 20.84,
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
                                        ),
                                        SizedBox(width: 25,),
                                        Container(
                                          width: 132.39,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: Color(0xff5600d4),
                                          ),
                                          child: GestureDetector(onTap: (){
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => SignIn()));
                                          },
                                            child: Center(
                                              child: Text(
                                                "Logout",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )



                          )

                      );

                    }
                );
              },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff5600d4),
                  ),
                  height: 50,
                  alignment: Alignment.center,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Center(
                    child: Text('Continue', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

