import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/RenterScreens/Renter_SignUp.dart';
import 'package:purpleavapp/Screens/service_provider/SignUp.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Image.asset('images/login.png'),
                Positioned(child:Image.asset('images/background.png',
                ),
                  top: 80,
                ),

              ]
            ),
          ),
          SizedBox(height: 50),
          RichText(
            text: TextSpan(
              text: 'WELCOME ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: "Lato",
                fontWeight: FontWeight.w500,
              ),
              children:  <TextSpan>[
                TextSpan(text: 'PURPLE AV!',
                  style: TextStyle(
                    color: Color(0xff5600d4),
                    fontSize: 22,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100,),



          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: 289,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, colors: [Color(0xff8600e9), Color(0xff5600d4)], ),
              ),
              child: Center(
                child: GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp(role: 0,)));
                },
                  child: Text(
                    "Register as Service Provider",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector( onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp(role: 1,)));
          },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 289,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, colors: [Color(0xff8600e9), Color(0xff5600d4)], ),
                ),
                child: Center(
                  child: Text(
                    "Register as End User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )


        ],
      ),


    );
  }
}
