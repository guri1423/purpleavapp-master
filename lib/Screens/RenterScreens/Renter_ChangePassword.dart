import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/otp.dart';

class Renter_Change_Password extends StatefulWidget {
  const Renter_Change_Password({Key? key}) : super(key: key);

  @override
  State<Renter_Change_Password> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<Renter_Change_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
                                builder: (context) => Otp()));
                          },

                              child: Icon(Icons.arrow_back_ios)),
                        ),
                      ],
                    ),
                    Text('Create New Password',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    SizedBox(height: 20,),
                    Text('Create new password and login your account',
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
                    image: AssetImage('images/login.png'

                    ),
                  ),
                ),


              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: 'New Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff9C037F),
                    ),
                    height: 50,
                    alignment: Alignment.center,
                    width:MediaQuery.of(context).size.width,
                    child: GestureDetector(onTap: (){

                    },
                      child: Center(
                        child: Text('Confirm', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ),
                    ),
                  ),
                ),
              ),




            ]
        )

    );
  }
}
