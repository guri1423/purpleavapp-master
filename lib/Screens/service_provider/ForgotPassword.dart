import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/forgotPassword_modal.dart';
import 'package:purpleavapp/Screens/service_provider/ChangePassword.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';
import 'package:purpleavapp/Screens/service_provider/otp.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final TextEditingController _emailcontroller= TextEditingController();

  userForgotPassword(ForgotPasswordService model) async {
    bool? status = await userForgotPass(model);

    if (status!){
      print("user verified");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Change_Password()));
    }

    else{
      print("user not verified");
    }

  }

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
                                  builder: (context) => SignIn()));
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
                    controller: _emailcontroller,
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
                  child: GestureDetector( onTap: (){
                    userForgotPassword(ForgotPasswordService(
                      email: _emailcontroller.text,
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
