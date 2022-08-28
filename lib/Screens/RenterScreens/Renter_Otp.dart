import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:purpleavapp/Screens/service_provider/ChangePassword.dart';
import 'package:purpleavapp/Screens/service_provider/ForgotPassword.dart';
import 'package:purpleavapp/Screens/RenterScreens/Renter_ChangePassword.dart';
import 'package:purpleavapp/Screens/RenterScreens/Renter_ForgotPassword.dart';

import '../service_provider/Num_Pad.dart';

class RenterOtp extends StatefulWidget {
  const RenterOtp({Key? key}) : super(key: key);

  @override
  State<RenterOtp> createState() => _RenterOtpState();
}

class _RenterOtpState extends State<RenterOtp> {


  final TextEditingController _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9C037F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector( onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => RenterForgotPassword()));
                },

                  child: Icon(Icons.arrow_back_ios,
                    color: Colors.white,),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
              height: 50,
              child: Text('Verification Code',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),

              )


          ),
          SizedBox(height: 10,),

          Column(
            children: [
              Container(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Please type the verification code sent',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
              ),
              Text('to xyz@gmail.com',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PinCodeTextField(

                controller: _myController,

                showCursor: false,
                // Disable the default soft keybaord
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                length: 4,
                appContext: context,
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                  });
                },


              ),
            ),

          ),


          // implement the custom NumPad
          // implement the custom NumPad
          Container(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Didnt receive the code? Resend',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),    ),
              )
          ),




          NumPad(
            buttonSize: 75,
            buttonColor: Color(0xff9C037F),
            iconColor: Colors.white,
            controller: _myController,
            delete: () {
              _myController.text = _myController.text
                  .substring(0, _myController.text.length - 1);
            },
            // do something with the input numbers
            onSubmit: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Renter_Change_Password()));
            },
          ),


        ],
      ),


    );
  }
}
