import 'package:flutter/material.dart';

class Carts extends StatelessWidget {
  const Carts({super.key,

    required this.image,
    required this.text1,
    required this.text2,
    required this.price


  });

  final String image;
  final String text1;
  final String text2;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      image: NetworkImage(image)),
                ),
        
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  IconButton(onPressed: () {
                    Navigator.pop(context);
        
                  }, icon: Icon(Icons.arrow_back, color: Colors.grey.shade700,)),
                ],
              ),
            ),
        
            SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(text1,style: TextStyle(color: Colors.grey),)),
        
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(text2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        
                    SizedBox(
                      width: 140,
                    ),
        
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("\$ $price", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                  ],
                ),
              ],
            ),
        
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)
                      ),
                      onPressed: () {
        
                  }, child: Text("Description",style: TextStyle(color: Colors.white),)),
                ),
              ],
            ),
           SizedBox(
             height: 10,
           ),
        
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",style: TextStyle(color: Colors.grey.shade700),)),

            SizedBox(
              height: 50,

            ),

            Row(
              children: [
                Container(
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        side: MaterialStatePropertyAll(BorderSide(style: BorderStyle.solid,color: Colors.deepPurple, width: 1.5))
                      ),

                      onPressed: () {

                  }, child: Row(children: [
                    Icon(Icons.shopping_bag_outlined),
                    SizedBox(
                      width: 2,
                    ),
                    Text("Add to Cart",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  ],)),
                ),

                SizedBox(
                   width: 20,
                ),
                Container(
                  height: 48,
                  width: 160,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                      ),

                      onPressed: () {

                      }, child: Text("Buy Now",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                  ),
                ),

              ],
            ),
        
          ],
        ),
      ),
    );
  }
}


