/// this is our custom drop down class

import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  List<String> title;
  bool expand;
  String ?hint;

  CustomDropDown({Key? key, required this.title,required this.expand,this.hint}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<bool> value = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Theme(
       data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ListView.builder(
          itemCount: widget.title.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: widget.expand?ExpansionTile(
                title: Row(
                  children: [
                    Checkbox(
                        fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Color(0xff9C037F);
                          }
                          return Color(0xff9C037F);
                        }),
                        value: value[index],
                        onChanged: (val) {
                          setState(() {
                            value[index] = val!;
                          });
                        }),
                    SizedBox(
                      width: 15,
                    ),
                    Text(widget.title[index]),
                  ],
                ),
                children: [
                  widget.hint=="package"?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none,
                              hintText:"ENTER PACKAGE DETAILS",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5)
                          ),
                        )),
                  ):Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none,
                            hintText:"Enter Price",
                            contentPadding: EdgeInsets.symmetric(horizontal: 5)
                          ),
                        )),
                  ),

                ],
              ): Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Checkbox(
                        fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Color(0xff9C037F);
                          }
                          return Color(0xff9C037F);
                        }),
                        value: value[index],
                        onChanged: (val) {
                          setState(() {
                            value[index] = val!;
                          });
                        }),
                    SizedBox(
                      width: 15,
                    ),
                    Text(widget.title[index]),
                  ],
                ),
              ),
            );
          }),
    );
  }
}









class CustomDropDown2 extends StatefulWidget {
  const CustomDropDown2({Key? key}) : super(key: key);

  @override
  _CustomDropDown2State createState() => _CustomDropDown2State();
}

class _CustomDropDown2State extends State<CustomDropDown2> {
  List<bool> value = [
    false,
    false,
    false,
  ];

  List<String>title=[
    "Delivery",
    "Pickup",
    "Shipping"
  ];
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ListView.builder(
          itemCount: title.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: index!=0?ExpansionTile(
                title: Row(
                  children: [
                    Checkbox(
                        fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Color(0xff9C037F);
                          }
                          return Color(0xff9C037F);
                        }),
                        value: value[index],
                        onChanged: (val) {
                          setState(() {
                            value[index] = val!;
                          });
                        }),
                    SizedBox(
                      width: 15,
                    ),
                    Text(title[index]),
                  ],
                ),
               children: [
                 index==2?Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                          color: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none,
                              hintText:"Enter Shipping Price",
                              contentPadding: EdgeInsets.symmetric(horizontal: 5)
                          ),
                        )),
                  ):addressForm(context),

                ],
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Checkbox(
                        fillColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Color(0xff9C037F);
                          }
                          return Color(0xff9C037F);
                        }),
                        value: value[index],
                        onChanged: (val) {
                          setState(() {
                            value[index] = val!;
                          });
                        }),
                    SizedBox(
                      width: 15,
                    ),
                    Text(title[index]),
                  ],
                ),
              ),
            );
          }),
    );
  }


  Widget addressForm(BuildContext context){
    return Column(
      children: [
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Address',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Land Mark',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Country',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'State',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'City',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 365,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
            color: Colors.white,
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Postal Code',
                hintStyle: TextStyle(
                  color: Color(0xffb9b9b9),
                  fontSize: 16,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),

        /// here you have to add all form fieds
      ],
    );
  }
}

