import 'package:ecommerce_app/otherClasses/storeData.dart';
import 'package:ecommerce_app/screens/signIn.dart';
import 'package:ecommerce_app/widgetPage/favourite.dart';
import 'package:flutter/material.dart';
import '../widgetPage/Categoris.dart';
import '../widgetPage/collections.dart';

class MainPage extends StatefulWidget {
  final email;
  const MainPage({super.key , required this.email});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int notificationCount=0;
  int bottomCurrentIndex=0;
  bool bottomColor=false;

  // use to open drawer
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.flip_camera_ios_outlined , size: 30,),
        backgroundColor: Color(0xFF929ED5),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.home_outlined  , size: 30 , color:Colors.black87, ),
            ),
            IconButton(
              onPressed: (){},
              padding: const EdgeInsets.only(right: 30,),
              icon: Icon(Icons.add_box  , size: 30, color:Colors.black87 , ),
            ),
            IconButton(
              onPressed: (){},
              padding: const EdgeInsets.only(left:30,),
              icon: Icon(Icons.access_time  , size: 30, color:Colors.black87 , ),
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.account_circle_outlined  , size: 30, color:Colors.black87 ,),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width-100,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF929ED5),
              ),
              child: Container(alignment: Alignment.bottomLeft,child: Text("${widget.email}", style: TextStyle(fontSize: 20 , color: Colors.white,),)),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 30,),
              child: ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  backgroundColor: MaterialStateProperty.all( Color(0xFFFFFFFF) ),
                  foregroundColor: MaterialStateProperty.all(Color(0xFF929ED5)),
                ),
                child: Text("My Profile" , style: TextStyle(fontSize: 18,),),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 30,),
              child: ElevatedButton(
                onPressed: ()async{
                  Navigator.of(context).push( MaterialPageRoute(builder: (context)=> FavouritesData(boolData:Collections().favClickList,) ) );
                },
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  backgroundColor: MaterialStateProperty.all( Color(0xFFFFFFFF) ),
                  foregroundColor: MaterialStateProperty.all(Color(0xFF929ED5)),
                ),
                child: Text("My Favourites" , style: TextStyle(fontSize: 18,),),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.only(top: 30,),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=> SignIn() ) );
                },
                style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  backgroundColor: MaterialStateProperty.all( Color(0xFFFFFFFF) ),
                  foregroundColor: MaterialStateProperty.all(Color(0xFF929ED5)),
                ),
                child: Text("Log out" , style: TextStyle(fontSize: 18,),),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(Icons.menu),
                      ),
                      Text("COLLECTION" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                      Badge(
                        label: Text("+$notificationCount"),
                        child: Icon(Icons.notifications_none_rounded),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-70,
                  height: 50,
                  margin: const EdgeInsets.only(top: 15,),
                  decoration: BoxDecoration(
                    color: Colors.white70,//white70
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search products",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30) , ),
                    ),
                  ),
                ),
                categories(),
                Container(
                  width: MediaQuery.of(context).size.width-60,
                  height: 50,
                  margin: const EdgeInsets.only(top: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New Arrivals" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,),),
                      Icon(Icons.arrow_forward_rounded , color: Colors.black54,),
                    ],
                  ),
                ),
                Collections(),

              ],

            ),
          ),
        ),
      ),
    );
  }
}










/*
bottomNavigationBar: BottomNavigationBar(
  onTap: (index){
    setState(() {
      bottomCurrentIndex=index;
    });
  },
  currentIndex:bottomCurrentIndex ,
  selectedIconTheme: IconThemeData(color: Color(0xFF929ED5)),
  unselectedIconTheme: IconThemeData(color: Colors.black54),
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined  , size: 30, ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box , size: 30, ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.access_time , size: 30, ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_outlined , size: 30, ),
      label: "",
    ),
  ],
),
*/





