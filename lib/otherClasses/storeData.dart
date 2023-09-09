import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

// shared preferences
var sharedInstance;
late String user,email,pass,phone;

saveDate(context , username , email , password , phonenumber , next_page)async{
  sharedInstance = await SharedPreferences.getInstance();
  await sharedInstance.setString("username", username);
  await sharedInstance.setString("email", email);
  await sharedInstance.setString("password", password);
  await sharedInstance.setString("phonenumber", phonenumber);

  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: "Registration Success",
    btnOkOnPress: (){
      Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=>next_page ) );
    },
  )..show();

}

checkEmailPass(context , mail , pass , next_page)async{
  bool check;
  sharedInstance = await SharedPreferences.getInstance();
  var email = await sharedInstance.getString("email");
  var password = await sharedInstance.getString("password");
  if(email==mail && password== pass)
    check= true;
  else
    check= false;
  AwesomeDialog(
    context: context,
    dialogType: check==true?DialogType.success:DialogType.error,
    animType: AnimType.rightSlide,
    title: check==true?"Email and password correct,welcome!":"Invalid email and password,try again",
    btnOkOnPress: (){
      if(check)
      {
        Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=>next_page ) );
      }
    },
  )..show();
  // user correct
}

getDate() async{
  sharedInstance = await SharedPreferences.getInstance();
  user = sharedInstance.getString("username")!;
  email = sharedInstance.getString("email")!;
  pass = sharedInstance.getString("password")!;
  phone = sharedInstance.getString("phonenumber")!;
}
//.....................
// .....................

