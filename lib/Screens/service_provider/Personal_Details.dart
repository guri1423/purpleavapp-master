import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';
import 'package:purpleavapp/main.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
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
                  builder: (context) => Home()));
            },

                child: Icon(Icons.arrow_back_ios)),
            Text('Personal Details',
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(height:  MediaQuery.of(context).padding.top),
          Container(
            width: MediaQuery.of(context).size.width,
            child: CircleAvatar(
              radius: 40,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            "User Name",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 10,),
          Text(
            "username123@gmail.com",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff2d2d2d),
              fontSize: 14,
            ),
          ),

          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "User name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),
          Divider(
            thickness: 0.8,
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "username123@gmail.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),
          Divider(
            thickness: 0.8,
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "username123",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),
          Divider(
            thickness: 0.8,
          ),

          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Phone No.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  "01234567890",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff2d2d2d),
                    fontSize: 16,
                  ),
                ),

              ],
            ),
          ),

          


        ],
      ),


    );
  }
}
