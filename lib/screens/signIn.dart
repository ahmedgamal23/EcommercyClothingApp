import 'package:ecommerce_app/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/otherClasses/storeData.dart' as storeData;

import 'mainPage.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formkey_ = GlobalKey<FormState>();
  bool obscurText = true;
  String? email,pass;

  void validation()async{
    final FormState? formState = _formkey_.currentState;
    if(formState!.validate())
      print("True");
    else
      print("No");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formkey_,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF116A7B),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFormField(
                          keyboardAppearance: Brightness.dark ,
                          validator:(value){
                            String ch;
                            if(value!.isEmpty){
                              ch= "Please fill email";
                            }else
                              ch= "";

                            if(ch == "")
                              email = value;
                            return ch;
                          },
                          decoration: InputDecoration(
                            hintText: "Email" ,
                            hintStyle: TextStyle(fontSize: 20 , color: Color(0xFF4F709C) , ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          validator:(value){
                            String ch;
                            if(value!.isEmpty){
                              ch= "Please fill password";
                            }
                            else
                              ch= "";

                            if(ch == "")
                              pass = value;
                            return ch;
                          },
                          obscureText: obscurText,
                          keyboardAppearance: Brightness.dark ,
                          decoration: InputDecoration(
                            hintText: "Password" ,
                            hintStyle: TextStyle(fontSize: 20 , color: Color(0xFF4F709C) , ),
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  obscurText=!obscurText;
                                });
                              },
                              child: obscurText==true?Icon(Icons.visibility):Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "If you don't have an account!"
                              ),
                              SizedBox(width: 2,),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return SignUp();} ));
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500 , color: Color(0xFF116A7B) , ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              validation();
                              // load data from firebase
                              storeData.checkEmailPass(context , email, pass, MainPage(email:email) );
                            },
                            style: ButtonStyle(
                              backgroundColor:MaterialStateProperty.all(Color(0xFF116A7B)),
                              shape: MaterialStateProperty.all( RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ),
                            ),
                            child: Text("Login" , style: TextStyle(color: Color(0xFFEADBC8) , fontSize: 20,),),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}










