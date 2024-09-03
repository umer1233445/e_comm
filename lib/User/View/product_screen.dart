import 'package:flutter/material.dart';
import 'package:umer/User/View/fetch_screen.dart';

class Product_Screen extends StatefulWidget {
  const Product_Screen({super.key});

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("PROFILE PAGE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
        actions: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: IconButton(onPressed: () {
                
              }, icon: Icon(Icons.search,size: 30,color: Colors.black,))),
        ],
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      body: Stack(
         children: [
           Container(
             height: 600,
             width: double.infinity,
             decoration: BoxDecoration(
               color: Colors.white,

             ),
           ),
           Container(
             margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
             height: 120,
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(14),
               image: DecorationImage(
                   fit: BoxFit.cover,
                   image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBwtIfauTojxyfG6NT2yEYue8yQlGiMSMRoQ&s")),
               color: Colors.black12,
             ),
           ),

           Positioned(
             left: 20,
             top: 75,
             child: CircleAvatar(
               radius: 40,
               backgroundColor: Colors.blue,
               backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAstbG5Q1Emmh1uVSwIwSYAJJTdUHVVV8EKA&s"),

             ),
           ),

           Positioned(
             left: 98,
             top: 130,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Jhon Nick", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                 Text("Jhon@gmail.com", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
               ],
             ),
           ),
           SizedBox(
             height: 20,
           ),

           Positioned(
             top: 170,
             child: Column(
               children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  height: 50,
                  width: 355,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.red.shade100,

                  ),
                ),

               ],
             ),
           ),

           Positioned(
             left: 18,
             top: 184,
             child: Row(
               children: [
                 Container(
                   height: 40,
                   width: 60,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage("data:image/png;base64,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")),
                   ),
                 ),
             
                 SizedBox(
                   width: 10,
                 ),
                 Container(
                   height: 40,
                   width: 60,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage("data:image/png;base64,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"))
                   ),
                 ),
             
                 SizedBox(
                   width: 10,
                 ),
                 Container(
                   height: 40,
                   width: 60,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage("data:image/png;base64,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"))
                   ),
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Container(
                   height: 40,
                   width: 60,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage("data:image/png;base64,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"))
                   ),
                 ),
                 SizedBox(
                   width: 10,
                 ),
             
                 Container(
                   height: 40,
                   width: 60,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw0PEA0NDQ0NDw0NDQ0ODQ0NDg8PDg4OFREWFiARFhUYHSkgGB0lGxYVIzEhJSkrLzEvFx83ODMsNygtLisBCgoKDg0OGhAQGi0fIB8uLS0rLS0tLS03NystLS0rKys3Ny0tLS0wLy0rLi0tKysrKysrKy0tKy0rLSstLS0rK//AABEIAOYA2wMBEQACEQEDEQH/xAAcAAADAQADAQEAAAAAAAAAAAAAAQIDBQYHBAj/xAA9EAACAQMBBgMFBQYFBQAAAAAAAQIDBBEhBQYSMUFREyJhB3GBkaEUMlKx0RUWI0JigkNyksHCJFNzk/H/xAAaAQEAAgMBAAAAAAAAAAAAAAAAAQQCAwUG/8QAMREBAAIBAgQDBgYCAwAAAAAAAAECAwQRBRIhMUFR0RMyYXGx4SJSkaHB8IHxFSNC/9oADAMBAAIRAxEAPwD2MAAAAAAAAAAAAAwA+EB8IBwgHCAsAGAFgAAAAAAAAAAAAAAAAAAAAAAADAFKIDUQHgB4AeADABgBYAMAJoCXEBNAIAAAAAAAAAAAAAAAAAAaQFpANICsAPABgB4AMAGAFgAwAsAJoCWgJaAnAAAAAAAAAAAAAAAICkgLSApIB4AYDAADABgAwAYAAEAYAnACaAhoCWgEAAAAAAAAAACAtICkgKSAoBgGAGAAMAAAABAGAEAgE0BLQEtAQ0AgAAAAAAAAKSAtIC0gGAwGAwAAAYAAAIAAAEAgABNAQ0BLQGbQAAAAAAANIDRIC0gGAwOF3i3qsrBYr1HKs1mNvSxKq13a5RXq8GF8la91nBpcmb3Y6ebz/aXtOvajatqNGhHpKWa1T64ivkyvbUT4Orj4VSPemZ/Zw1TfTbEtXfVF6RhRivpE1+2v5rMcOwR/5+r6LTf/AGvTetxCqvw1qMGvnFJ/UmM94Y34Zhnw2+Uu27D9p9CbUL6i6DenjU81KWfVfej9TdXPE93PzcKvXrjnf4O+29enUjGpSnGdOa4oThJSjJd01zN8Tu5dqzWdpjaWhKAB1XeLfyxs3KlFu4uI5TpUWuGD7TnyXuWX6Gq+WtV/T8Py5uvaPOXRr/2k7TqN+CqNvHooQ8SfxlPT6I0Tnt4Otj4Rhj3t5/Zxj3y2vnP26r/opY+XCYe2t5rH/G6f8n19X32XtE2rTa8SdKvHqqtJRePfDBlGezTk4Tgt23j/AD6u57v+0OzuXGncJ2tZ4S8SSlRk+yqdP7kjfTNWe/RytRwzLi61/FH7/wB+TuJuc0AS0BLQESQEAAAAACA0SAtICkAwOl7/AO+X2NfZbVp3k45lPRq3g+uOs30XTm+ienLl5ekd3T0Gh9tPPf3fr9nkk3KcpTnKU5zblOc25SlJ9W3zKUy9JTFERtClAx3WIxnwEbsuQcBO7GaIcCd2E43N7q7z3GzqmYNztpS/jW7flf8AXD8Mvz69MbceSay5+r0Nc1fKfCf74Pb9m39K5pU7ihNTpVY8UZL8mujT0aL0TExvDy2THbHaa27w823/AN95zlOxsZuNOLcLi4g8SnLk6cGuSXVrn7udbLl8Idvh/Do2jJkj5R/Lz6NMqzLvxRaiRu2RQ+EjdlyBxG5NESgZRLXbG7juNvpO0lC1u5uVm2owqSeZW3x6w9OnTsWMWXbpPZxNfw6Mm98cfi+v3+r11NPDTTT1TWqaLjzZAJoCGgM2gEAAAFRQFpAWgKA4/eHasbO2r3Ukn4cPJF/z1G8Rj8ZNGN7csbt2nwzmyRSPF4HWrTqznVqyc6lWcp1JvnKTecnPtO87vZYscViIiOkKjE1zK3Wq0jFuiowE8owEcpNE7sZoiUSYlqtRyuyN5bq0t7q1pSfBcpcMs60ZPSUo+rjp78M30yTETDmZ9DTLlrefD93EQgaZl0aUaJGLfFTwGcVPBCdhgGxNEsLVZTiZRKter1P2VbcdahOyqyzUtUnSb5u3eiX9r09ziXsF9428nluK6fkye0jtbv8AP7+rvTN7kkwJaAzkgIAAAC4oDRAUgGgPPPbDetU7O2T0qVKlafuglFfWb+RX1E9Ih2eD497Wv5dP1/081gUpempDRGKzVRDYAkAAQMBjNUOJlu0zTqpIhtrUyGewCQAAAYyiRlDRdzW4V66G0bV5xGrKVCfqqiwl/q4fkWMM7Whx+J4+fBb4df0+z3Fl55MgJYESAzYCAEBpEDRAUA0B5N7X5P7ZbR6K0TXvdSf6Iqaju9DweP8ArtPx/h0qJVl36NEYrFVENgCQAAAAEbAJAAAAAAwxlEjKGi7XZEnG6tJLmrq2a/8AbE207woaqN8dvlP0fodnReKSwEwIYGcgJAcQNIgWgKQDQHlntio4uLOr0nQqQ+MJp/8AMq6iOsO/we34bR8YdEgVJego1RisVMhtASAAAAAAAAAAAAAxlEjKGi7693KHiXtjBfzXdBv3Kak/ombscb2hzdZblw3n4S/QLOg8algJgQwIkBAFRA0iBaAaApAdI9rNg6llCulra14yl/45+R/Vw+RpzxvXd0+FZOXNy/mj7vJYMoy9VSW0TBZqohugBIAAAAAAAAAAAAYYWZTZlCveXavZbYOrfqq15bWlOo3045LgS+sn/aWsFd7buHxbLy4eX80/d7IXHmSYEgSwM5AQBUQNIgWgGgKQGG0LOFxRq29RZp1qc6cu+JLGV6kTG8bM8d5paLR3h+e76zqW1arbVVipRm6cvXHKS9GsNejRzrV2naXtMGWMlYtXtJRZrldpK0Yt8AMgAAAAAAAAAAACZLXaWNRmcKmSXsfsy2K7azVWpHFa8arSTWHGnjyRfwzL3zZfw15a/N5HiWf2ubaO1en+fF202ueTAkCWBEgMwKiBpEC0A0BSAaA8+9qe7jqQW0aEc1KMeG5iuc6K5T98fyfoV89N45odfheq5Leyt2nt8/u8wpyKUw9TSzVGKzWTIbAAAAAAAAAAAARKJsyhovLn9xN3Xf3KdSObS3cZ18rSo+lL49fRPuixhx80uLxLV+xptHvT29XtxeeUIBMCQJYGcgIAcQNUBaAaApANATNrDTSaaw0+TXYDxffrdl2NXxaMf+jrSfBj/Bm/8N+nb5dClmxcvWOz1PDdd7WvLb3o/f4+rrkWVZh3KWWQ3gJAAAAAAAAACbJa7S22Zs6td1oW1BZnN6t/dhHrOXojbSk2naHO1WprhpN7Pc939lUbKhTtqK0isym/vVJvnN+r/Q6FaxWNoeNz57ZrzezkjJpIBMCWBLAzkBDAaA0iBaApANANAY1WShxu0aFOtTnRrRU6dSPDKL6r9fUTETG0sqXtS0WrO0w8f3k2DUsamNZ282/Bq/8ACXaS+v5c/NhmkvXcP19c9fK0d4/lxkZFeYdml91ENoAAAAAAAAbDGbbHbW9SvUhRowc6k3iMV+bfRLubaUm07Qo6nU1x1m1p2iHrW6ewqdjT4ViVaph1quPvP8K7RR0ceOKQ8ZrNZbUX3ntHaHZaTM1R9JCQwJYCYEMDOQEgCA0iBaAoCkA0BFaBI4+vElDi9o2tOtCdKrBTpzWJRf5+j9RMRMbSyx5LY7Ras7TDzDeHYFSzk5RzO2b8tTrD+mf68mc/NgmvWOz1fD+JVzRyz0t5eno4qMits7VbqTIbYsAyAAABEylsnZrtdrY2da5qKlQjxSerfKMF+KT6I248c2naFDVaumGvNeXpu7WwqVnDEfPVnjxazWHL0XaPodHHjikPH6vWX1Nt56R4R/fF2KhEzVXI0IEDZkJIBASwIkBnIBAAFRYGiAtANAMCkBhXoZJiRxlxQZkxcZdUU04yScWmmmsprs0ExMxO8Ohbf3WlTcqtonKHOVDnKP8Ak7r0KmXTeNXoNDxftTN+vr6utRn/APClMPQ0ybrTMW+t1ZIbOYmyWM2RKZMQ02u5HY2xa12015KKfmqtc/SK6v6FjFgm/wAnJ1vEqYI2728vV6JsfZlK3gqdGGFzk3rKb7yfVl+tIrG0PLZ8981ua87ubt6LMmlylvbmMyl9WMEJIBMCQJYESYGbAAABoC4sDRMBgUgGgGmBFSkpAcfc2PYy3Q4q5s32JQ6rt7dmnXzOP8Ot+NLSX+ZdffzNWTDW/XtK/pOIZNP0nrXy9HSL2zrW8uCtBxf8sucZeqfUoXxzWdpeo02sx5q70lkpmrZdi5R4pNRinKUnhRistv0RlWu/SGrJmisbzO0O1bD3SbxUul6qinp/c/8AZF3Fp9utnnNZxebfhw/r6O72llhJKOEkkklhJdi04c7zO8uXtrF9iN0uSpW6iRulqQEwEAgJYEtgZyYEgAAAAVFgaJgUgKAYDAeQGBnOjGXNAfLV2ZCRO6NnHXu7NKtFwqKMoPmpL6+gnaY2lnS9sduas7S6ffey2p4kfs9zCNGT86qqTnTX9OPvfHHvZVtp436O1i4xMU2vXefh/ejsmx9ybe1Xkw5tearLWcvj0XoixStadnL1Gqy553vPTy8HNUtlQjzM91bZ9lO3hHkiN0tSAsgIBAJgICWwIkwM2AAAAAACYGiYFpgUmAwGAwAB5AMgAAAAABkBAACAQCAlsCWwM2wEAAAAAAADTAtMC0wKTAYAAwGAAAAAAAAAgABAICWwJbAhsCQAAAAAAAAABpgWmBSYFJgMBgGQHkAAAAAAWQABAGQJbAlsCGwJAAAAAAAAAAAAAaYFJgUmBSYDyA8gADAAABAGQFkBZATYEtgS2BIAAAAAAAAAAAAAAAGQKTApMBpgPIDyAZAMgGQDICyAsgJsCWwJbAAAAAAAAAAAAAAAAAAAAAMgNMB8QD4gHkA4gDiAXEAcQE5AWQAAAAAAAAAAAANvDhlx41xJJuOVlJ9cAONGL5SzjR4w9QDwF3/IAdGP4uXPloAKhHnxac86cgFClFrMZZXdNNAV9nXdgT4MdfNy58tAH4EeXFr20APAj+L16AHgx/Fz06cwFGlFtpSy46SSaynjOvYAlTgsNzSTaSbaWW9EgK8Bd2AvBXLi17aZAVSnCKzKaiu8mkgJj4T5VYvTOkovTuA1Cn+Nc8c1z7AX9nXdgLwY8uLXXTToApU4LnNLLSWWllt4SAfgLu/oAoUoyWYyyu6aaAr7Ou7ASoxy1xarmtMoAdGK1cse/AEypwWjmk9NG11Av7Ou7Azu9nUar4qkOJ8PDniknjto/UDKWx7Z8bdP76al55pNOXFyz3Ax/d6zakpU21KTk81Jrn00fIDSOxLVKKjTa4FUUXxzfDxx4XzfZAZLd62XSfPOss66fogH+wLfMWuNOK4ViWNOFx+OjAqOwbbEk4SkpOLknJrLTys4xkC/2La44fD04XHHHPk58b6/i1AlbCtNP4WMNvSc+b+IBDYVpFOKpPhcoya8So8tZx19WALYNpw8HheXjU/v1M8STSec5WjYFVNi20scVNvGEv4lTRJYxz7AFLYttBNQpuKaSwqlTlrpz05v5gSthWf/AGV6+eevL19EBUti2rUYum+GPJeJUwvvev8AVIAhsW2i2403HMlJ4qVOa5Y10+AFvZVu+dPP8Pw8ylNvg4ZRxlvtJr4gL9k2+JpwbU3mSc5vXElnn/VL5gKpsa1lq6WvCo6SmtFHhXJ9EBT2Tb8XH4fmw1xcU844eHHPsBH7Gt1nhg4uWMuM5ZaWmNXy1fzA+f8Adu182lTzY4vO8vTH+wFz3ftm8yU5PCWZSzoun0XyAUd37ZZxx+bHF5/vYaevyQErdy38uXVfDlJuSTw3nGiQD/d2210n5k01xaYfTHRAUtgUMYzU/l14lnyttdOnE/mByoH/2Q=="))
                   ),
                 ),
               ],
             ),
           ),

           Positioned(
             left: 25,
             top: 250,
             child: Row(
               children: [
                Container(
                    height: 170,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("data:image/jpeg;base64,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")),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(child: Text("Jhon-D", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30, color: Colors.black),)),

                      ],
                    )),

                 SizedBox(
                   width: 15,
                 ),
                 Container(
                     height: 170,
                     width: 150,
                     decoration: BoxDecoration(
                         color: Colors.blue,
                         borderRadius: BorderRadius.circular(8),
                         image: DecorationImage(
                             fit: BoxFit.cover,
                             image: NetworkImage("https://media.istockphoto.com/id/1412290868/photo/young-man-looking-sideways-against-a-gray-background.jpg?s=612x612&w=0&k=20&c=H32k1xmWiL2w076_RZ6it_gEDvmRqcEsYkID3we4DJA="))
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Center(child: Text("John-Vick", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),)),
                       ],
                     ))
               ],
             ),
           ),

           Positioned(
             left: 25,
             top: 430,
             child: Column(
               children: [
                 Row(
                   children: [
                    Container(
                        height: 170,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://st4.depositphotos.com/10290464/27023/i/450/depositphotos_270237428-stock-photo-close-up-portrait-of-serious.jpg"))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(child: Text("Jhon-Jick",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),)),
                          ],
                        )),

                     SizedBox(
                       width: 15,
                     ),

                     Container(
                         height: 170,
                         width: 150,
                         decoration: BoxDecoration(
                           color: Colors.blue,
                           borderRadius: BorderRadius.circular(8),
                           image: DecorationImage(
                               fit: BoxFit.cover,
                               image: NetworkImage("https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGluc3RhZ3JhbSUyMHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww")),
                         ),

                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Center(child: Text("Jhon-hick", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)),
                           ],
                         )),
                   ],
                 ),

               ],
             ),
           ),


         ],


      ),



    );
  }
}
