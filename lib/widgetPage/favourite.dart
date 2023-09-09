import 'package:flutter/material.dart';

class FavouritesData extends StatefulWidget {
  final List<bool> boolData;
  const FavouritesData({super.key , required this.boolData,});

  @override
  State<FavouritesData> createState() => _FavouritesDataState();
}

class _FavouritesDataState extends State<FavouritesData> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          itemCount: 1,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,mainAxisExtent: 250,childAspectRatio:1/2  , crossAxisSpacing: 20 , mainAxisSpacing: 20),
          itemBuilder: (context , index){
            return Container(
              padding: const EdgeInsets.all(10),
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
                              image: AssetImage("assets/images/redHoodie.jpg"),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(right: 10,top: 10,),
                        child: InkWell(
                          onTap: (){},
                          child: Icon(Icons.favorite , color: Colors.red,),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${"redHoodie"}",
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
                      '${"\$55"}',
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








