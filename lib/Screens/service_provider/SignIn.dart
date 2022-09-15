import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:purpleavapp/Modal/SignIn_Modal.dart';
import 'package:purpleavapp/Screens/RenterScreens/Home_Screen.dart';
import 'package:purpleavapp/Screens/service_provider/ForgotPassword.dart';
import 'package:purpleavapp/Screens/service_provider/SignUp.dart';
import 'package:purpleavapp/Screens/service_provider/home.dart';

import 'package:purpleavapp/Screens/welcom_screen.dart';
import 'package:purpleavapp/Services/ApiServices.dart';
import 'package:purpleavapp/Services/storage_services.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  bool _showPassword = false;
  bool _ischecked = false;
  bool changeButton=false;

  List<String> items =['Service Provider', 'End User'];
  String? selectedItem = 'End User';

  final StorageServices _services = StorageServices();

  late Box box1;

  getEmailAndPass() async {

    _email.text = await _services.getEmail() ?? "";
    _password.text = await _services.getPass() ?? "";
    debugPrint(await _services.getPass());
    if (await _services.getPass() != null) {
      setState(() {
        _ischecked = true;
      });
    } else {
      setState(() {
        _ischecked = false;
      });
    }
  }

  // void createBox()async{
  //   box1= await Hive.openBox('logindata');
  // }
  // void getdata(){
  //   if(box1.get('email')!= null){
  //     _email.text = box1.get('email');
  //   }
  //   if(box1.get('password')!= null){
  //     _password.text = box1.get('password');
  //
  //   }
  // }

  String changeRole(index){
    switch(index){
      case 'Service Provider':
        return "service";
      case 'End User':
        return "renter";
      default:
        return "renter";
    }
  }

  void login() {
    if (_ischecked) {
      box1.put('email', _email.text);
      box1.put('password', _password.text);
    }
  }

  userSignIn(Login model) async {
    bool? status = await userLogin(model);
    setState(() {
      changeButton = false;
    });
    if (status!) {
      print("user registered");
      if(selectedItem =="Service Provider"){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Home()
      ), (route) => false);}
      else if (selectedItem =="End User"){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> RenterHome()
      ), (route) => false);}
    }
    if(status) {
      debugPrint('try again');


    }
  }

  @override
  void initState() {
   getEmailAndPass();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 290,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 20),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));
                            },
                            child: Icon(Icons.arrow_back_ios)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('LOGIN',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Login to continue',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('images/login.png'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: _email,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )),
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              )),
          SizedBox(height: 20),
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
                    child: Text(item, style: TextStyle(fontSize: 14),))).toList(),
                onChanged: (items) => setState(() {
                  selectedItem = items;
                }) ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Color(0xff5600d4);
                    }
                    return Color(0xff5600d4);
                  }),
                  value: _ischecked,
                  onChanged: (value) {
                    _ischecked = !_ischecked;
                    setState(() {});
                    if (_ischecked) {
                    } else {
                      _services.removeEmailAndPass();
                    }
                  }),
              Text('Remember Me'),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xff5600d4)),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                // if(selectedItem =="service"){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Home()
                // ), (route) => false);}
                // else if (selectedItem =="renter"){ Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> RenterHome()
                // ), (route) => false);}



                setState(() {
                  changeButton=true;
                });

                // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                await _services.storeEmail(_email.text);
                if (_ischecked) {
                  print("saved");
                  await _services.storeEmail(_email.text);
                  await _services.storePass(_password.text);

                } else {
                  debugPrint("not remember");
                }

                userSignIn(Login(
                      email: _email.text,
                      password: _password.text,
                      role: changeRole(selectedItem),
                )
                );

                // userLogin(Login(
                //   email: _email.text,
                //   password: _password.text
                // ));
                // login();
                //
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => Home()));
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  shape: changeButton? BoxShape.circle: BoxShape.rectangle,
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Color(0xff8600e9), Color(0xff5600d4)],
                  ),
                ),
                height: 50,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: changeButton? CircularProgressIndicator(
                    color: Colors.white,
                  ): Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account?  ',
              style: TextStyle(fontSize: 15, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: ' Sign Up',
                    style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      }),
              ],
            ),
          )
        ]),
      ),
    );
  }
}



// String changeRole(index){
//   switch(index){
//     case 0:
//       return "service";
//     case 1:
//       return "renter";
//     default:
//       return "renter";
//   }
// }
