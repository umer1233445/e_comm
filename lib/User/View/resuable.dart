import 'package:flutter/material.dart';

class Custom_tab extends StatelessWidget {
  const Custom_tab({
    super.key,
    required this.name,

  });

  final String name;


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 30,
        width: 95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, style: BorderStyle.solid),
        ),
        child: Center(
            child: Text(name)));
  }
}


class card_list extends StatelessWidget {
  const card_list({
    super.key,
    required this.heading,
    required this.heading2,
    required this.price,
    required this.image,

  });

  final String heading;
  final String heading2;
  final String price;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 275,
          width: 195,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(14)
          ),

        ),
        Positioned(
          left: 10,
          top: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 160,
                width: 170,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image))
                ),
              ),

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(heading, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17))),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(heading2, style: TextStyle(color: Colors.grey))),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("\$ $price",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),))
                    ],
                  ),
                  SizedBox(
                    width: 32,
                  ),
                  IconButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.grey.shade300)
                      ),
                      onPressed: () {

                      }, icon: Icon(Icons.favorite_border_outlined)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
