import 'package:flutter/material.dart';


import '../../Modal/renter_model/contact_modal.dart';
import '../../Modal/user_profile_modal.dart';
import '../../Services/ApiServices.dart';

class ContactusRenter extends StatefulWidget {
  const ContactusRenter({Key? key}) : super(key: key);

  @override
  State<ContactusRenter> createState() => _ContactusRenterState();
}

class _ContactusRenterState extends State<ContactusRenter> {
  addData(Contact model)async{
    bool ? status = await contactDetails(model);
    if(status!){
      print("data added");
      Navigator.pop(context);
    }else{
      print("try again later");
    }
  }

  TextEditingController _email = TextEditingController();
   TextEditingController _phone = TextEditingController();
   TextEditingController _name = TextEditingController();
  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff5600d4),
        title: Row(
          children: [
            GestureDetector( onTap: (){
              Navigator.pop(context);
            },

                child: Icon(Icons.arrow_back_ios)),
            Text('Contact Us',
            ),
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
            _name = TextEditingController(
                text: snapshot.data!.user.name
            );
            _email = TextEditingController(
                text: snapshot.data!.user.email
            );
            _phone = TextEditingController(
                text: snapshot.data!.user.phone
            );
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Text(
                    "GET IN TOUCH",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w500,
                    ),
                  ),


                  SizedBox(height: 40,),
                  Container(
                    width: 365,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                      color: Colors.white,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Name',
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
                  SizedBox(height: 5,),
                  Container(
                    width: 365,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                      color: Colors.white,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Email',
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
                  SizedBox(height: 5,),
                  Container(
                    width: 365,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                      color: Colors.white,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Phone Number',
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
                  SizedBox(height: 5,),
                  Container(
                    width: 365,
                    height: 178,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Color(0xffdbdbdb), width: 1.50, ),
                      color: Colors.white,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _message,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Your Message',
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
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        addData(Contact(
                          name: _name.text,
                          email: _email.text,
                          phone: _phone.text,
                          message: _message.text,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff5600d4),
                        ),
                        height: 50,
                        alignment: Alignment.center,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Center(
                          child: Text('Submit', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),),
                        ),
                      ),
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
