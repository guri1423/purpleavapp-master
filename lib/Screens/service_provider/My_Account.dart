import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/user_profile_modal.dart';
import 'package:purpleavapp/Screens/service_provider/Contact_us.dart';
import 'package:purpleavapp/Screens/service_provider/Transactions.dart';
import 'package:purpleavapp/Screens/service_provider/logout.dart';
import 'package:purpleavapp/Services/ApiServices.dart';


class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {


  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Color(0xff5600d4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "My Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
      ),
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
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(
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
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 450,
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
                                              fontWeight: FontWeight.w600,
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
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children:[
                                            GestureDetector(
                                              onTap:(){
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: 120,
                                                height: 38,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4),
                                                  color: Color(0xffb3b3b3),
                                                ),
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
                                              width: 120,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Color(0xffe40613),
                                              ),
                                              child: GestureDetector( onTap: (){
                                                Navigator.pushReplacement(context,
                                                    MaterialPageRoute(builder: (context) => Logout()));
                                              },
                                                child: Center(
                                                  child: Text(
                                                    "Confirm",
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
                                      )
                                    ],
                                  )



                              )

                          );

                        }
                    );
                  },
                    child: Container(
                      child: Row(
                        children:const [
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
      body: FutureBuilder<UserProfileModel>(
        future: userProfile(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(
              child: Text("something went wrong"),
            );
          }
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(height:  MediaQuery.of(context).padding.top),
                  SizedBox(height: 30,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child:
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:NetworkImage("https://purpleapp.omkatech.com/${snapshot.data!.user.profilePic}"),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    snapshot.data!.user.name,
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
                    snapshot.data!.user.email,
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
                          snapshot.data!.user.name,
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
                          snapshot.data!.user.email,
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
                          snapshot.data!.user.phone,
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
          return Center(child: CircularProgressIndicator());

        },


      ),


    );
  }
}
