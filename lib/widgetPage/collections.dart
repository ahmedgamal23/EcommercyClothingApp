import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Collections extends StatefulWidget {
  Collections({super.key});

  List<bool> favClickList = List.filled(20,false);

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {

  List data=[];

  Future<void> getJsonData()async{
    final String l = await rootBundle.loadString('JSON/data.json');
    final d = json.decode(l);
    setState(() {
      data = d['items'];
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
    return Center(
      child: Container(
        width: double.infinity,
        height: 350,
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,mainAxisExtent: 250,childAspectRatio:1/2  , crossAxisSpacing: 20 , mainAxisSpacing: 20),
          itemBuilder: (context , index){
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage("${data==null?CircularProgressIndicator():data[index]["img"]}"),
                            fit: BoxFit.fill,
                          )
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(right: 10,top: 10,),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              //favClick=!favClick;
                              widget.favClickList[index] = !widget.favClickList[index];
                            });
                          },
                          child: Icon(widget.favClickList[index]==true?Icons.favorite:Icons.favorite_border ,
                                      color: widget.favClickList[index]==true?Colors.red:Color(0xFFFFFFFF), size: 30,),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${data==null?CircularProgressIndicator():data[index]["name"]}",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${data==null?CircularProgressIndicator():data[index]["price"]}',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}





