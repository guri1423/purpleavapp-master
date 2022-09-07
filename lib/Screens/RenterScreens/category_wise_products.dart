import 'package:flutter/material.dart';

import 'package:purpleavapp/Modal/renter_model/search_modal.dart';
import 'package:purpleavapp/Screens/RenterScreens/product_details.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

import '../../Modal/renter_model/category_search_modal.dart';

class CategoryProducts extends StatefulWidget {
  int id;
  CategoryProducts({Key? key,
  required this.id
  }) : super(key: key);

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {

  final TextEditingController _search= TextEditingController();




  @override
  void initState() {
    debugPrint(widget.id.toString());
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff5600d4),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const[
                Text(
                  "View Products",
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
        body: SingleChildScrollView(
          child: Column(
            children: [

              FutureBuilder<GetCategoryProductModal>(
                future: categorySearch(widget.id),
                builder: (context,snapshot){
                  if (snapshot.hasData){

                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.category!.data!.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x42000000),
                                    blurRadius: 3,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                child: Column(
                                  children:[
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 144,
                                              height: 136,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(7),
                                                color: Color(0xfff4f4f4),

                                              ),

                                              child: GestureDetector(
                                                onTap: (){
                                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(model: snapshot.data!.data[index])));
                                                },
                                                child: Image.network("https://purpleapp.omkatech.com/${snapshot.data!.category!.data![index].productImages![index].url}"),
                                              ),
                                            ),

                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                            Text( snapshot.data!.category!.data![index].name!,
                                              style: TextStyle(
                                                color: Color(0xff727171),
                                                fontSize: 22,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Text(
                                              "Rent -\$${snapshot.data!.category!.data![index].weekendPrice}",
                                              style: TextStyle(
                                                color: Color(0xff0a0a0a),
                                                fontSize: 18,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 30,),
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(model: snapshot.data!.category!.data![index],)));
                                              },
                                              child: Container(
                                                width: 186,
                                                height: 26,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(3),
                                                  color: Color(0xff5600d4),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: const[
                                                    Text(
                                                      "View Details",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: "Lato",
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),




                                  ],
                                ),
                              ),
                            ),
                          );
                        });

                  }

                  if (snapshot.hasError){
                    return Center(child: Text('Search to see the products'));
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        )
    );
  }
}
