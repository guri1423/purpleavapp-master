import 'package:flutter/material.dart';
import 'package:purpleavapp/Screens/RenterScreens/Main_Screen.dart';
import 'package:purpleavapp/Screens/RenterScreens/MyAccount_Screen.dart';



class TransactionRenter extends StatefulWidget {
  const TransactionRenter({Key? key}) : super(key: key);

  @override
  State<TransactionRenter> createState() => _TransactionRenterState();
}

class _TransactionRenterState extends State<TransactionRenter> {
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
            Text('Transaction History',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10),
        child: Column(
          children: [
            Material(
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 63,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0x029c037f),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              width: 410,
              height: 94,
              child: Stack(
                children:[Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "Received From",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                  Positioned(
                    left: 285,
                    top: 16,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "\$200.45",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 26,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "Malia Smith",
                        style: TextStyle(
                          color: Color(0xff4b4b4b),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 64,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "18 May 2022",
                        style: TextStyle(
                          color: Color(0xff8d8d8d),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 64,
                    child: SizedBox(
                      width: 78,
                      height: 18,
                      child: Text(
                        "Debited From",
                        style: TextStyle(
                          color: Color(0xff484848),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 308,
                    top: 51,
                    child: Container(
                      width: 43,
                      height: 43,
                      child: Image.asset('images/google-pay 1.png'),
                    ),
                  ),],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 410,
              height: 94,
              child: Stack(
                children:[Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "Received From",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                  Positioned(
                    left: 285,
                    top: 16,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "\$200.45",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 26,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "Malia Smith",
                        style: TextStyle(
                          color: Color(0xff4b4b4b),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 64,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "18 May 2022",
                        style: TextStyle(
                          color: Color(0xff8d8d8d),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 64,
                    child: SizedBox(
                      width: 78,
                      height: 18,
                      child: Text(
                        "Debited From",
                        style: TextStyle(
                          color: Color(0xff484848),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 308,
                    top: 51,
                    child: Container(
                      width: 43,
                      height: 43,
                      child: Image.asset('images/google-pay 1.png'),
                    ),
                  ),],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 410,
              height: 94,
              child: Stack(
                children:[Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "Received From",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                  Positioned(
                    left: 285,
                    top: 16,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "\$200.45",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 26,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "Malia Smith",
                        style: TextStyle(
                          color: Color(0xff4b4b4b),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 64,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "18 May 2022",
                        style: TextStyle(
                          color: Color(0xff8d8d8d),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 64,
                    child: SizedBox(
                      width: 78,
                      height: 18,
                      child: Text(
                        "Debited From",
                        style: TextStyle(
                          color: Color(0xff484848),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 308,
                    top: 51,
                    child: Container(
                      width: 43,
                      height: 43,
                      child: Image.asset('images/google-pay 1.png'),
                    ),
                  ),],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 410,
              height: 94,
              child: Stack(
                children:[Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "Received From",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                  Positioned(
                    left: 285,
                    top: 16,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "\$200.45",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 26,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "Malia Smith",
                        style: TextStyle(
                          color: Color(0xff4b4b4b),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 64,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "18 May 2022",
                        style: TextStyle(
                          color: Color(0xff8d8d8d),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 64,
                    child: SizedBox(
                      width: 78,
                      height: 18,
                      child: Text(
                        "Debited From",
                        style: TextStyle(
                          color: Color(0xff484848),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 308,
                    top: 51,
                    child: Container(
                      width: 43,
                      height: 43,
                      child: Image.asset('images/google-pay 1.png'),
                    ),
                  ),],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 410,
              height: 94,
              child: Stack(
                children:[Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "Received From",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                  Positioned(
                    left: 285,
                    top: 16,
                    child: SizedBox(
                      width: 125,
                      height: 20,
                      child: Text(
                        "\$200.45",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 26,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "Malia Smith",
                        style: TextStyle(
                          color: Color(0xff4b4b4b),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 64,
                    child: SizedBox(
                      width: 114,
                      height: 18,
                      child: Text(
                        "18 May 2022",
                        style: TextStyle(
                          color: Color(0xff8d8d8d),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    top: 64,
                    child: SizedBox(
                      width: 78,
                      height: 18,
                      child: Text(
                        "Debited From",
                        style: TextStyle(
                          color: Color(0xff484848),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 308,
                    top: 51,
                    child: Container(
                      width: 43,
                      height: 43,
                      child: Image.asset('images/google-pay 1.png'),
                    ),
                  ),],
              ),
            ),



          ],
        ),
      ),

    );
  }
}
