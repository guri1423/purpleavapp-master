import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/welcom_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


  Color coloValue =  Color(0xff5600d4);
  void changeColor()async{
await Future.delayed(Duration(seconds: 1));
setState(() {
  coloValue =Colors.white;
  widgetArea = Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('images/purple_logo_horizontal.png'),
    ],
  );
});
await Future.delayed(Duration(seconds: 2));
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
}

 Widget widgetArea =Container();


@override
  void initState() {
    changeColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:coloValue ,
        child:widgetArea
      )

    );
  }
}




