import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/service_provider/ChangePassword.dart';
import 'package:purpleavapp/Screens/RenterScreens/Renter_Otp.dart';
import 'package:purpleavapp/Screens/RenterScreens/Renter_SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';
import 'package:purpleavapp/Screens/service_provider/otp.dart';

class RenterForgotPassword extends StatefulWidget {
  const RenterForgotPassword({Key? key}) : super(key: key);

  @override
  State<RenterForgotPassword> createState() => _RenterForgotPasswordState();
}

class _RenterForgotPasswordState extends State<RenterForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [

                Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GestureDetector( onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => RenterSignIn()));
                            },

                                child: Icon(Icons.arrow_back_ios)),
                          ),
                        ],
                      ),
                      Text('Forgot Password',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      SizedBox(height: 20,),
                      Text('Please enter your email id and get code',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ],
                  ),

                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('images/image1.png'

                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(12),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff9C037F),
                    ),
                    height: 50,
                    alignment: Alignment.center,
                    width:MediaQuery.of(context).size.width,
                    child: GestureDetector(onTap:(){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RenterOtp()));

                    },
                      child: Center(
                        child: Text('Continue', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ),
                    ),
                  ),
                ),




              ]
          ),
        )
    );
  }
}
