

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/RenterScreens/Bookings_Screen.dart';
import 'package:purpleavapp/Screens/RenterScreens/Cart_Screen.dart';
import 'package:purpleavapp/Screens/RenterScreens/MyAccount_Screen.dart';
import 'package:purpleavapp/Screens/RenterScreens/renter_home.dart';
import 'package:purpleavapp/Screens/RenterScreens/viewproducts.dart';
import 'package:purpleavapp/Screens/RenterScreens/wishlist.dart';

class RenterHome extends StatefulWidget {
  int? index;
   RenterHome({Key? key, this.index}) : super(key: key);

  @override
  State<RenterHome> createState() => _RenterHomeState();
}


List<Widget>_body=[
  RenterHomeScreen(),
  RenterBooking(),
  RenterCart(),
  MyAccountRenter(),

];

class _RenterHomeState extends State<RenterHome> {
  int selectindex=0;
  @override
  void initState() {
    if(widget.index != null){
      selectindex = widget.index!;
    }else{
      selectindex=0;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height:Platform.isIOS?55:65,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 50,
                  onPressed: (){
                    setState(() {
                      selectindex=0;
                    });
                  }, icon: ImageIcon(AssetImage("images/homerenter.png",),
                  color: selectindex==0? Color(0xff5600d4):Color(0xff6f6f6f),
                ),
                ),
                IconButton(
                  iconSize: 50,
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
                GestureDetector( onTap: (){

                },
                  child: IconButton(
                    iconSize: 50,
                    onPressed: (){
                      setState(() {
                        selectindex=3;
                      });
                    }, icon: ImageIcon(AssetImage("images/rentermyaccount.png",),
                    color: selectindex==3? Color(0xff5600d4):Color(0xff6f6f6f),),),
                ),




              ],
            ),
          ),

        ),
      ),
      body: _body[selectindex],

    );
  }
}
