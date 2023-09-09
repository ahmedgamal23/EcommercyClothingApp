import 'package:ecommerce_app/screens/signIn.dart';
import 'package:flutter/material.dart';

class splachScreen extends StatefulWidget {
  const splachScreen({super.key});

  @override
  State<splachScreen> createState() => _splachScreenState();
}

class _splachScreenState extends State<splachScreen> {

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splachbg_.jpg"),
                  fit: BoxFit.fill,
                ),
              ),

            ),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 120,),
              child: Text(
                "Collections",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF1D6A3),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 180,),
              child: Text(
                "for Men,Women & Kids",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF1D6A3),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=>SignIn() ) );
              },
              child: Container(
                alignment: Alignment.center,
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(left: 50 , right: 50 , bottom: 150,),
                decoration: BoxDecoration(
                  color:Colors.black87,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(color: Colors.red , blurStyle: BlurStyle.normal , offset: Offset(0.5,0.5) , blurRadius: 2 , spreadRadius: 3 )],
                ),
                child: Icon(
                  Icons.arrow_right_alt,
                  size: 50,
                  color: Color(0xFFF1D6A3),
                ),
              ),
            ) ,

          ],
        ),
      ),
    );
  }
}

