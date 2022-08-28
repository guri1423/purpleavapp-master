import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/SignIn_Modal.dart';
import 'package:purpleavapp/Modal/create_password_model.dart';
import 'package:purpleavapp/Screens/service_provider/ForgotPassword.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/otp.dart';

import '../../Services/ApiServices.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  State<Change_Password> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<Change_Password> {
  final TextEditingController _emailcontroller= TextEditingController();
  final TextEditingController _newpasscontroller= TextEditingController();
  final TextEditingController _confirmpasscontroller= TextEditingController();

  changePassword(CreateNewPasswordModal modal) async{
    bool? status = await newPassword(modal);
    if(status!){ print("Password changed");
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));

    }
    else{
      print("try again");
    }
  }

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
                                builder: (context) => ForgotPassword()));
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
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _newpasscontroller,
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
                  controller: _confirmpasscontroller,
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
                    changePassword( CreateNewPasswordModal(
                        email: _emailcontroller.text,
                        password:_newpasscontroller.text,
                        confirmpassword: _confirmpasscontroller.text

                    ));


                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff5600d4),
                    ),
                    height: 50,
                    alignment: Alignment.center,
                    width:MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text('Confirm', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ),
                  ),
                ),
              ),




            ]
        )

    );
  }
}
