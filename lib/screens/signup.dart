import 'package:ecommerce_app/screens/signIn.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/otherClasses/storeData.dart' as storeData;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

GlobalKey<FormState> _formKey_filed = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  bool obscurText = true;
  String? user,email,pass,phone;
  //final RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void validation()async{
    final FormState? _form = _formKey_filed.currentState;
    if(_form!.validate())
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
          key: _formKey_filed,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 35,
                      color: Color(0xFF102C57),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 450,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        validator:(value) {
                          String ch;
                          if(value!.length < 6){
                            ch = "Username is too short";
                          }else if(value.isEmpty){
                            ch = "Please fill username";
                          }
                          else
                            ch = "";

                          if(ch == "")
                            user = value;
                          return ch;
                        },
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Color(0xFF102C57),),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator:(value){
                          String ch;
                          if(value!.isEmpty){
                            ch =  "Please fill email";
                          }/*else if(emailValid.hasMatch(value)){
                            ch =  "Email is invalid";
                          }*/
                          else
                            ch = "";
                          if(ch == "")
                            email = value;
                          return ch;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Color(0xFF102C57),),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: obscurText,
                        validator:(value){
                          String ch;
                          if(value!.isEmpty){
                            ch = "Please fill password";
                          }else if(value.length < 8){
                            ch = "Password is too short";
                          }
                          else
                            ch = "";
                          if(ch == "")
                            pass = value;
                          return ch;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Color(0xFF102C57),),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                obscurText= !obscurText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child:obscurText==true?Icon(Icons.visibility):Icon(Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator:(value){
                          String ch;
                          if(value!.isEmpty){
                            ch = "Please fill phone number";
                          }else if(value.length < 11 || value.length > 11){
                            ch = "please enter valid phone number";
                          }
                          else
                            ch = "";
                          if(ch == "")
                            phone = value;
                          return ch;
                        },
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Color(0xFF102C57),),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Text(
                              "I have already an account!",
                            ),
                            SizedBox(width:3,),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){return SignIn();} ));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Color(0xFF5B9A8B) , fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 50,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ElevatedButton(
                          onPressed: (){
                            validation();
                            // save data in firebase
                            storeData.saveDate(context , user, email, pass, phone , SignIn());
                            //..............
                          },
                          style: ButtonStyle(
                            backgroundColor:MaterialStateProperty.all(Color(0xFF102C57)),
                            shape: MaterialStateProperty.all( RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ),
                          ),
                          child: Text("Register" , style: TextStyle(color: Color(0xFFEADBC8) , fontSize: 20,),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}










