


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:purpleavapp/Modal/renter_model/banner_modal.dart';
import 'package:purpleavapp/Screens/RenterScreens/category_wise_products.dart';
import 'package:purpleavapp/Screens/RenterScreens/viewproducts.dart';
import 'package:purpleavapp/Screens/RenterScreens/wishlist.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

class RenterHomeScreen extends StatefulWidget {
  const RenterHomeScreen({Key? key}) : super(key: key);



  @override
  State<RenterHomeScreen> createState() => _RenterHomeScreenState();

}


class _RenterHomeScreenState extends State<RenterHomeScreen> {
  @override
  void initState() {
     getAllbanner();
    super.initState();
  }

  int? index;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,



        backgroundColor: Color(0xff5600d4),
        title: Row(
          children: [


            Text('Home',
            ),
            Spacer(),
            GestureDetector( onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Wishlist()));
            },
              child: Container(
                child: Row(
                  children: [
                    Image.asset('images/heart.png'),
                    SizedBox(width: 10,),
                    Text('My List',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: "Lato",
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<GetBannerModal>(
          future: getAllbanner(),
          builder: (context,snapshot){
            if (snapshot.hasData){

                return Column(
                  children: [
                    Center(
                      child: CarouselSlider.builder(itemCount: snapshot.data!.banner.length, itemBuilder: (context, index, realIndex){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Image.network("https://purpleapp.omkatech.com/${snapshot.data!.banner[index].banner}"),
                        );
                      }, options: CarouselOptions(height: 200,
                      autoPlay: true)),
                    ),

                    SizedBox(height: 10,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        Container(
                          width: 9.46,
                          height: 9.46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffd9d9d9),
                          ),
                        ),
                        SizedBox(width: 11.31),
                        Container(
                          width: 9.46,
                          height: 9.46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff1f1f1),
                          ),
                        ),
                        SizedBox(width: 11.31),
                        Container(
                          width: 9.46,
                          height: 9.46,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff1f1f1),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10,),
                    GestureDetector( onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProducts()));
                    },
                      child: Container(
                        width: 364,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xff5600d4), width: 1.50, ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(Icons.search),
                              ),
                              SizedBox(width: 33),
                              Text(
                                "Search here ",
                                style: TextStyle(
                                  color: Color(0xff6f6f6f),
                                  fontSize: 18,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.4,
                      width: MediaQuery.of(context).size.width,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),


                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 106,


                      ),
                          itemCount: 9,
                          itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            // debugPrint(name[index]);
                            // debugPrint(categoryChange(name[index]).toString());

                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProducts(id: categoryChange(name[index]))));

                          },
                          child: Container(
                            width: 100,
                            height: 106,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffdbdbdb),
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                            ),

                            child: Column(

                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Image.asset( imagePath[index],
                                    color: Color(0xff5600d4)),
                                SizedBox(height: 18),
                                Text(
                                 name[index],
                                  style: TextStyle(
                                    color: Color(0xff2d2d2d),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                          }),
                    ),
                    

                  ],
                );

            }

            if (snapshot.hasError){
              return Center(child: Text('Something went wrong'));
            }
            return Center(child: CircularProgressIndicator());
          },


        ),
      ),

    );
  }

  List<String> imagePath=[
   'images/audio.png',
    'images/video.png',
    'images/Uplight.png',
    'images/stage.png',
    'images/network.png',
    'images/instrument.png',
    'images/production.png',
    'images/crew.png',
    'images/other.png'

  ];


  List<String> name=[
    "Audio",
    "Video",
    "Lighting",
    "Stage",
    "Network",
    "Instruments",
    "Production",
    "Crew",
    "Other",

  ];


  int categoryChange(String selectedCat){
    switch(selectedCat){
      case "Audio":
        return 1;
      case "Video":
        return 2;
      case "Lighting":
        return 3;
      case  "Stage":
        return 4;
      case  "Network":
        return 5;
      case "Instruments":
        return 6;
      case  "Production":
        return 7;
      case "Crew":
        return 8;
      case "Other":
        return 9;
      default :
        return 1;
    }
  }

}
