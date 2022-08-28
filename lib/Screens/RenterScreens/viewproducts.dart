import 'package:flutter/material.dart';

import 'package:purpleavapp/Modal/renter_model/search_modal.dart';
import 'package:purpleavapp/Screens/RenterScreens/product_details.dart';
import 'package:purpleavapp/Services/ApiServices.dart';

class ViewProducts extends StatefulWidget {
  const ViewProducts({Key? key}) : super(key: key);

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {

  final TextEditingController _search= TextEditingController();


@override
  void initState() {
  // searchProducts(_search.text);
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onFieldSubmitted: (value){

                  setState(() {
                    print("on tap is working");
                    searchProducts(_search.text);
                  });
                  },
                controller: _search,
                decoration: InputDecoration(
                  border: InputBorder.none,

                    contentPadding: const EdgeInsets.all(12),

                    hintText: 'Search here',

                    suffixIcon: GestureDetector( onTap: (){
                      setState(() {
                        print("on tap is working");
                        searchProducts(_search.text);
                      });

                    },

                        child: Icon(Icons.search_rounded)),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    )
                ),
              ),
            ),

            FutureBuilder<GetSearchModal>(
              future: searchProducts(_search.text),
              builder: (context,snapshot){
                if (snapshot.hasData){

                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context,index){
                        return Container(
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
                          child: Column(
                            children:[
                              Padding(
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
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(model: snapshot.data!.data[index])));
                                                },
                                                child: Image.network("https://purpleapp.omkatech.com/${snapshot.data!.data[index].productImages![index].url}"),
                                              ),
                                            ),

                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                            GestureDetector(onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(model: snapshot.data!.data[index])));

                                            },
                                              child: Text(  snapshot.data!.data[index].name!,
                                                style: TextStyle(
                                                  color: Color(0xff727171),
                                                  fontSize: 22,
                                                  fontFamily: "Lato",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Text(
                                              "Rent -\$${snapshot.data!.data[index].weeklyPrice}",
                                              style: TextStyle(
                                                color: Color(0xff0a0a0a),
                                                fontSize: 18,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 30,),
                                            Container(
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
                                                    "Add to Cart",
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
                                          ],
                                        ),
                                      ],
                                    ),




                                  ],
                                ),
                              ),


                            ],
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
