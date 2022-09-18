import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purpleavapp/Screens/RenterScreens/Home_Screen.dart';
import 'package:purpleavapp/Screens/service_provider/SignIn.dart';
import 'package:flutter/gestures.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';
import 'package:purpleavapp/Screens/welcom_screen.dart';
import 'package:purpleavapp/Services/storage_services.dart';



class SignUp extends StatefulWidget {

   SignUp({Key? key,}) : super(key: key);


  @override
  State<SignUp> createState() => _SignUpState();
}

bool changeButton=false;
bool _showPassword = false;

class _SignUpState extends State<SignUp> {




    final TextEditingController _password = TextEditingController();
    final TextEditingController _emailController=TextEditingController();
    final TextEditingController _userController=TextEditingController();
    final TextEditingController _phoneNoController=TextEditingController();



    registration()async {
      debugPrint(_emailController.text);
      debugPrint(_password.text);
      debugPrint(_userController.text);
      debugPrint(_phoneNoController.text);

    }

    List<String> items =['Service Provider', 'End User'];
    String? selectedItem = 'End User';

  File? _image;
    final StorageServices _services = StorageServices();

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);

    });
  }
    // if (image ==null) return;
    // final imageTemporary = File(image!.path);
  getImage1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);

    });
  }

    //  userSignUp(Register model)async{
    //   bool ? status = await userRegister(model) ;
    //
    //
    //   if(status!){
    //     if(widget.role ==0 ){Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));}
    //     else if (widget.role==1){Navigator.push(context, MaterialPageRoute(builder: (context)=> RenterHome()));}
    //
    //   }else{
    //     /// here you can add dialog box
    //     print("please try again");
    //   }
    //
    // }





    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: SingleChildScrollView(
            child: Column(
                children: [

                  Container(
                    height: 260,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, bottom: 20),
                                child: GestureDetector(onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));
                                },

                                    child: Icon(Icons.arrow_back_ios)),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),


                          Text('SIGN UP',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          SizedBox(height: 20,),
                          Text('Register to continue',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ],
                      ),
                    ),

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('images/image1.png'

                        ),
                      ),
                    ),
                  ),
                  // Container(
                  // //   child: CircleAvatar(
                  // //     backgroundColor: Colors.grey,
                  // //     radius: 60,
                  // //     backgroundImage: AssetImage('images/shimla.jpg'),
                  // //   ),
                  // // ),

                  GestureDetector(onTap: () {
                    showDialog(context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              children: [
                                                Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffd72027),
                                                    shape: BoxShape.circle,

                                                  ),
                                                  child: Icon(Icons.close,
                                                    color: Colors.white,
                                                    size: 15,),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(vertical: 5),
                                              child: Container(
                                                width: 289,
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(4),
                                                  color: Color(0xff5600d4),
                                                ),
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      getImage();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Import from gallery",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontFamily: "Lato",
                                                        fontWeight: FontWeight
                                                            .w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(vertical: 5),
                                              child: Container(
                                                width: 289,
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(4),
                                                  color: Color(0xff5600d4),
                                                ),
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      getImage1();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Import from Camera",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontFamily: "Lato",
                                                        fontWeight: FontWeight
                                                            .w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 20,),

                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                    child: Container(child:
                    _image != null ? CircleAvatar(
                      radius: 50, backgroundImage: FileImage(_image!),) : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(radius: 50,),
                        Icon(Icons.add_a_photo_outlined
                          ,
                          color: Colors.white,),
                      ],
                    )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: _userController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Enter Full Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,

                        obscureText: _showPassword,
                        controller: _password,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Enter Password',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            child: Icon(
                              _showPassword ? Icons.visibility : Icons
                                  .visibility_off,
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: validateMobile,

                      controller: _phoneNoController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Enter Phone number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 54,
                    width: MediaQuery.of(context).size.width*0.95,
                    child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(width: 1, color: Colors.grey)
                          ),
                          disabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(width: 1, color: Colors.grey)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(width: 1, color: Colors.grey)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(width: 1, color: Colors.grey)
                          ),

                        ),
                        value: selectedItem,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item, style: TextStyle(fontSize: 15),))).toList(),
                        onChanged: (items) => setState(() {
                          selectedItem = items;
                        }) ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(

                      onTap: () {


                        uploadImage(_image!);
                        setState(() {
                          changeButton =true;
                        });




                        // userSignUp(Register(
                        //       name: _userController.text,
                        //       password: _password.text,
                        //       email: _emailController.text,
                        //       phone: _phoneNoController.text,
                        //
                        //     ));


                        //
                        // userRegister(Register(
                        //   name: _userController.text,
                        //   password: _password.text,
                        //   email: _emailController.text,
                        //   phone: _phoneNoController.text,
                        //
                        // ));

                          // Navigator.pushReplacement(context, MaterialPageRoute(
                          //     builder: (context) => Home()));

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: changeButton? BoxShape.circle: BoxShape.rectangle,

                          gradient: LinearGradient(begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xff8600e9), Color(0xff5600d4)],),
                        ),

                        height: 50,
                        alignment: Alignment.center,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Center(
                          child: changeButton? CircularProgressIndicator(
                            color: Colors.white,
                          ) :Text('Register ', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account?  ',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: ' Login', style: TextStyle(fontSize: 15,
                          color: Color(0xff5600d4),),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(
                                    builder: (context) => SignIn()));
                              }),
                      ],
                    ),
                  )


                ]
            ),
          )

      );
    }
    void uploadImage(File _image)async{
    debugPrint(_emailController.text);
    debugPrint(_password.text);
    debugPrint(_phoneNoController.text);
    debugPrint(_userController.text);
    debugPrint(_image.path);
      var stream = http.ByteStream(DelegatingStream.typed(_image.openRead()));
      var length = await _image.length();
      var uri =Uri.parse("https://purpleapp.omkatech.com/api/register");
      var request=http.MultipartRequest("POST", uri);
      request.fields["email"] = _emailController.text;
      request.fields["name"] = _userController.text;
      request.fields["phone"] = _phoneNoController.text;
      request.fields["password"] = _password.text;
      request.fields["role"] = getRole(selectedItem!);
      var multipartFile= http.MultipartFile('profile_pic', stream, length,filename: _image.path);
      request.files.add(multipartFile);
      await request.send().then((response) async{

        response.stream.transform(utf8.decoder).listen((value) async {
          // debugPrint(value[0]);
          // debugPrint(value);
          debugPrint(fromJson(json.decode(value)));
          debugPrint(getToken(json.decode(value)));
          String checkStatus = status(json.decode(value));
          debugPrint(checkStatus);
          _services.storeEmail(_emailController.text);
          _services.storeToken(getToken(json.decode(value)));
          setState(() {
            changeButton = false;
          });

          if (fromJson(json.decode(value))== "User Registered Successfully |")
          {

            if (selectedItem == 'Service Provider' ){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Home()
            ), (route) => false);}
            else { Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> RenterHome()
            ), (route) => false);}
          }
          if(checkStatus == "false"){
            debugPrint("Not added");
            String msg = fromJson(json.decode(value));
            Fluttertoast.showToast(msg: msg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);


          }
        }
        );
      }).catchError((e){
        print(e);
      });
    }

   String fromJson(Map<String, dynamic> json) =>
        json["message"];
    }
 String getToken(Map<String, dynamic> json) =>
 json["token"];
    String fromJson(Map<String, dynamic> json) =>
        json["message"];
    String status(Map<String, dynamic> json) =>
        json["status"];






    String getRole(index){
      switch(index){
        case 0:
          return "service";
        case 1:
          return "renter";
        default:
          return "renter";
      }
    }

String validateMobile(value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Mobile is Required";
  } else if(value.length != 10){
    return "Mobile number must 10 digits";
  }else if (!regExp.hasMatch(value)) {
    return "Mobile Number must be digits";
  }
  return 'Enter Mobile Number';
}








