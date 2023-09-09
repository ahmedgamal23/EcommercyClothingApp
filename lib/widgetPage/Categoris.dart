import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class categories extends StatefulWidget {
  categories({super.key});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {

  List catedata=[];

  Future<void> getJsonData()async{
    final String l = await rootBundle.loadString('JSON/categories.json');
    final data = json.decode(l);
    setState(() {
      catedata = data['items'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      margin: const EdgeInsets.only(top: 20,),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catedata.length,
        padding: const EdgeInsets.symmetric(horizontal: 10,),
        itemBuilder: (context , index){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 60,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage('${catedata[index]['img']}'),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                Text("${catedata[index]['name']}" , style: TextStyle(fontSize: 17, color: Colors.black54, ),),
              ],
            ),
          );
        },
      ),
    );
  }
}







