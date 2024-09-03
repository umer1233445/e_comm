import 'package:flutter/material.dart';
import 'package:umer/User/Controller/user_services.dart';
import 'package:umer/User/Model/user_model.dart';
import 'package:umer/User/View/cart_screen.dart';
import 'package:umer/User/View/explore_screen.dart';
import 'package:umer/User/View/product_screen.dart';
import 'package:umer/User/View/resuable.dart';
import 'package:umer/User/View/update_user.dart';
import 'package:umer/User/View/user_login.dart';
import 'package:umer/User/View/user_register.dart';
import 'package:umer/User/View/whist_list.dart';

class Fetch_Screen extends StatefulWidget {
  const Fetch_Screen({super.key});

  @override
  State<Fetch_Screen> createState() => _Fetch_ScreenState();
}

List tabname =[
  "Filter","All","Official Store","Nearest","Best Sell"
];

List heading = ['Advanced\nEyelash','AHA/BHA\nExfoliating','AHA+ Ultra\nSoftening',
  'A-Team Duo','Acne Spray','Skincare Bundle \n by Clarins'];

List heading1 = ['Conditioner','Cleanser','Foot Cream','Advanced Kit',' Treatment','For Your intensive \n body care set'];

List price = ['39.00','49.56','99.67','20.40','67.78','20.00'];

List images = [
  'https://liven.com.pk/cdn/shop/files/13.jpg?v=1715621554&width=1445'
  'data:image/jpeg;base64,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',
  'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPEBIQDxAPEA0QEBAPDg8PEBAPDQ8QFREWFxURFRUYHSggGRolGxUVITEhJSkrLi4uFx8zODMsNygtLisBCgoKDg0OGA8PFisdFRkrLSstLSstLSsrLS03LS0rNy03KysuLS0tKystKy0rKystLS0rKystKysrKysrLSsrK//AABEIAPsAyQMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAABAIDBQYBB//EAEMQAAIBAgQBBgoIBQIHAAAAAAABAgMRBBIhMUEFEyJRcZEGFDJCUmGBobHBMzRykqKy0eEjYoPC8LPxJENTVGNz0v/EABcBAQEBAQAAAAAAAAAAAAAAAAABAgP/xAAeEQEBAAMAAwEBAQAAAAAAAAAAAQIRMQMhQRJhMv/aAAwDAQACEQMRAD8A+4gAAAAAAAAAGa6tnrmXBmkKzpqd0909Hxs9UShbn/W9H1/uDr76vvX6lVXCNbalSpsx7aNLEet7dYeMet94tkYOA3Rc8T63v1h41633iriRsTZo54ztq+8jz763v1/uLxRNU7jdRd4w9d/Vr+5GWJas22rLXVfqU1YKO5kYmrzlSFJbTnGD7HJJ+642adjhb83C++SN773si0AOqAAAAAAAAAAAAAAAAAAAAAWk7VPtRX+e4ZFMZpKD7V8CUWzQtJDTFqwoieNHmY5vlyOIeLpOSrzwCpVujhJOFRYjm5a1bNOUXG6jZpKTV+DIOhcUQdNGT4JxxMcLBYtt1LyyKbUq8aN/4ca0lpKolu1+5rSkZUKKQSqWISkUVJDYWx1fRiPIKz4yn/Lnm/ZFpe+SJY+ZZ4GwviakvRo5fvTX/wAmJ7ya+OzAAO7AAAAAAAAAAAAAAAAAAAAAFcetE/5vkNC+OXQ7GiUeweiFcfG8JLpK8ZK8LKauvNvxL8O+iiOIWgHOLnU06cFZKd5RhKldPJdxpyv07J2vo32a35q7k3eSipwyxyxtKPjM1Ju6v9GoPS3WPsDFVx1Dk3Gwp4WSnUm6bc40ZyleNSeGq5lWlfpQVTKorhnfUrNU6uNtDPKvzbk8zhTpPEKfNxyxadNLI5ZtUt7a5dTpj0bHGcmxx0KVGnUVenShSpw/gwpSrqccJhssekmnHnHiLt8Yxu0hnCVcVLESVTnY0GqkrTUHGEo1UoQjJQV1KDb3lstbp36aYnXZLRk4+Ro+BDSeInJpJulFezO/mjJxstTR8Eofwqkuus17FCH6szh/pq8ddHEQez+KLTLgh3CzurdWx3YXgAAAAAAAAAAAAAAAAAC2Mxaprrm9l82BdUqRiryaSEa+NU04pOztq9OPUIzm5O8ndkoIlGhhHoWVVoU4V7l8hODOkeBVmt7pp7Wad+zuYrKrre63stdL9RiqaPSiWJjFXk0uGrtrZv4J9xVDEJ9KMoyT0ummn6iC+oxDEyGZ1U1utXbfj1duj7hLEyJVjIxktzd8E4/8Mn6VSo/xW+Rz2Le50vg1phKXrzvvqSY8fVy40y2lUs7lFycDsw0oyTV0eiuGlrbrGgAAAAAAAAAAAAACFaqoRcnsl/iMGc3JuT3f+WH+WKnkx6+k/l8xCKAnFFkUQRYgL6D1LMYpunJU2o1JRcYyeqg3pntxtvbja2hRBmbg+UZyoc4qnPVv4dqOfDyc219GnTSy5tdXtlu9EzOIpq8nVI2hnjGEavOQdGPN5IulOLgoyz+c73v572sLT5NqzSgqkEourNTnDnJc5KpJxqWi4pSin+J6aD86s5yjaUprmoTbgqcYuTlUumpLMvJStura6idPGNQzRrqq5UalScLU0qMowvdJK6Sl0bTu9VroyVTVXDSqRndKM8mSCurJuznJNp8UlqvMvbWwl4hUVs0pRfOupmjKnKbXMuFvo1He2lvaaOKxig8yeaKp1ZZY9KUpRlTUYq3F57W62hLxidSnZ1ZxqQqQjOXNKlzkZyjaeSrC6WsknbeL3IEK+Dq6JTgsmeUHOLnJ1JVXNTdnFJpKP3pe1qvO6vs7aq97PqF8ViJqpZPNGPOOSss0oxVLa3FZ27cduoysRj3aMs78iE1GHNvnczfpbrRK0Wnr60Zqxbi3ozqORbxw1FNNXpRavxur395yeNl0X7T6JyVRTwtCMloqFJfgRfGZFYsuieVMFOL6PSj+JE6VCb4W7Tqyvwq1v1DRGnBRVkSAAAAAAAAAAAAAAMXlV/xOyKRREY5Xjaon1xXzFosC6JNFaJoC2J5XxGTLGNOdScrtQp5FLLG15XnJKyzJb+cj2JGvh87jKM505xzJShkbyyteLUk1boxe3Beu+IK6uITjOVpLJ5SatLyFO1uyXfczqOPWSVTm5xjppejKVSWyUck2m7tLVrc0qmD6MlnqNTXSvkd3zahe+W97RT7TKnyerKEp1JxUlJLoU9UnbWnGPGz7Ui1V/j0L01ratFyhKyUVbLpLqbzL2q29rpy5TjOUYRUunCM1rTVlJXV05ZntwTRcuTIKOW8rdOycm7Z5Rk9XrfNG6d932CviVskc83GmoJRap2bha0m8t09FezS0MBbx/PHPGnUt0VHWi3JyfC09N1vYrc1KN8rTTaallzRa7G13MZjydGMMjlKcOh0ZxpW6LVtoq+y3F50lBZYq0U20lZJXbdlbhqZrUZvKD6L7GfUMHG1OmuqEF3RR8u5R8ln0ZYia0vtpsjfjTJogZ3jM+v3Ijz0vSZ0ZaYGaqsvSfeyyGIkuN+0B4CmniE99PgXAAAACmMxeXox8rj6hFzk9XKXeyFSV5yb9KXxJoCdOvOO0m11PVGjh6ymrrsa6mZbL+TJdOS4ON/an+4ByzDSMuptd/wDsZ0DW5X+jX2l8GZUEBYiaIxRNIC2JYiuBMx9USegtIukyiQpFciiZbNlM2c6paszOxLH6zM7EMjTNxau0uuUV70fQWcDJXq0111aa/Gjv2dPGzk8PD0DoyESR4SQHqLqNW2j2+BSiQD4FGHnw7i8DG5RpOnPN5k3e/VLiiqNQ3ZxTVmk0909UxGfJNN7Z4+qMtPfcBCVVI0eTaDinKSs5bLiok6GApwd0ryXGTu/0GgM7liWkY9bb7v8AcQii7H1M1R9UeivZv7yuKAnFEjxEkBZE9PIkjH1VciiRdMpmSimZRMumUVGYaK1mZ9YerMz6r1IpWkr4iiv/AD0vzo71nC4JXxND/wBsH3M7k64M5AD0DbIRJESSAkj0iiQE6bs0xwQG8wFgAAAVYmrkg5dS07eBaIcrytBLrl8mBmxLYlUC2IE0SPESQEokiKJIx9VXNFExiZRUJVhaYvUL6gtVMLCtZiFUdrMSqEVXyb9ao/bv+FnbnE8kfW6XbP8AJI7U64cZyegRuFzbKRJELkkwJo9IpnoE4odsK4aN3fghsAAAADP5aXQi+qXyZoC+Po56ckt7XXatQMWDLYsVpyGIsC5E0VRZNMCxEkQiTRzvVRmLVRiYtVJVhaoLVBioLVDKwpWEqg5WYlUIo5E+uUv6n+nI7Ro43kFf8ZT7Kn+mztGjrhxjJWyNyySKZG0TTJJlGYkpAMJk4Jt2RGhQlLhZdbH6VJRWm/FgSpwyqxIAAAAAAAADB5Vwrpyzx8iT1/ll1dgvCodJOKkmmk09GnszExnJMo9Kl0o+j5y7OsCEZlikIKq07NNNbpqz7i2NYB+mywXw0rr2/JDCOd6qExeqXzF6hFhaoK1RmoK1TKlKwnUG6wpUIqfg79ch9mp+RnanF+Dn1yP2Kn5WdqdcOMZdQtcYhgV5z9iJ4Wn53sRTylVd1BaJq8vWuC+JtFscJS4K7+0/1LoUIR2ivmZ1JW2NGjO69ewFgAAAAAAAAAAAAAAABCpSjLSUYyX8yTKHydR/6cfZdDQAZ+Ioxg0oxUVZ7cStDGO3XYyhI53qq5i1QaqIynWqPeOmVu1pXzXlp3Jd5CPagrUZ6q0nC+W0rNtNSWqXU9VrwFalSfVfV7Jx0ytri+Nl3mdKhVFKhdGbkrtWfFa6FNQjS3wb+tx+xU/KdqcV4N/W4/ZqflO2grtL1nbDjGR2krRXYKcpYeTtOKu46NLdr1DwGkY9Cbbsk79Vnc1KMLK3HdlgAAAAAAAAAAAAAAAAAAAAAJ43yl2fMqRZjPKXZ82VoxeqrqCtWI5IoqImhn1UKVEaNSIpVpmbF2zKotUNCtSEq1MaVLwc+tR+zP8AKzvcJDzu44bwapXxkE9rVPyM+gpWOmPGa9AANIAAAAAAAAAAAAAAAAAAAAAAAMPwr5SeFhTqRgpudVUrOeRJOEpX2d/J94tguUZVVpTy9sl8ja5ToxnBKcYyWZO0kpK9nrqJ0cLCPkxS7NDN0PMtV7Qv2Sj+pTVhWX/KfslB/MezNbP4FNatP0vdH9DPpWHiMdKLtKlVT7E/mQjXqTV40KzX9NfGQ1ioZndtt+wp8YqQVoysuyL+RPQSqVav/bVfvUF/eL4idRLWlb7U4/23GauIqem+6P6ClecpbybG4ujvgBiFXr4hzgozw6pqDjNyT5zOnforXoe87s5LwEppPEWSV+ZvZWv9IdadMeJQAAVAAAAAB5cD0Dy4XA9AAAAAAAAAAAAAXxvk+1C0RrGeT7UKROeXVj2QnialnZb8RyV+oy6z1fazFrUiMmUV6V1ddxa5AmNjIqIXqDtZa7fAUqp9XvMq3PAjev8A0v7zqbnCcgcoqhzubznD3Zv1NSXhDE74cYvXTOSPHURy75euShys2aR0vOnnOmLSxcpDVPMwH+cPc5RTpsvjECSYHqQASAAAAAAAAAAAAArxELxa9ohnS3uu1WNMDNmxlOvHrXeKVoQk73V+035RT3SZB0IPzI/dRn8LtzjpwXFd5VUqQXGK7WdK8NT9CH3Ynni8PQh92I/C7cTXr01vOH3kK1K6fkKc31QhKfwR9DjFLZJdiSJRQ/H9NvnuH5Fr1Ok6coJ7Kas7dho0PBifnM7Ox6bk0y5yh4NpbmhR5Hpx4GmBRRDCRWyLVBEgA8segAAAAB//2Q==',
  'data:image/jpeg;base64,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',
  'data:image/jpeg;base64,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',
  'data:image/jpeg;base64,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'
];
class _Fetch_ScreenState extends State<Fetch_Screen> {

  UserFirebaseServices uServices = UserFirebaseServices();
  String uEmail = "";
  @override
  void initState() {
      UserFirebaseServices.getUserCred().then((value) {
        setState(() {
          uEmail = value;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("BABA Experess", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
       actions: [
         Container(
           child: IconButton(onPressed: () {
           }, icon: Icon(Icons.search, size: 30,)),
         ),
         Container(
           child: IconButton(onPressed: () {
           }, icon: Icon(Icons.notifications, size: 30,)),
         ),
       ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: tabname.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Custom_tab(
                          name: tabname[index]),
                    ],
                  );
                },),
            ),
            SizedBox(
              height: 5,
            ),
            
            Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 9),
                    child: Text("Special Offer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
        
                SizedBox(
                  width: 189,
                ),
              GestureDetector(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => Explore_Screen(),));
                },
                  child: Text("View More", style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),))
              ],
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Explore_Screen(),));

              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey.shade200,
                    ),
                  ),
                  Positioned(
                    left: 17,
                    top: 16,
                    child: Container(
                      height: 138,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: NetworkImage("https://liven.com.pk/cdn/shop/files/13.jpg?v=1715621554&width=1445")),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 190,
                    top: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Skincare Bundle \n by Clarins", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        Text("For Your intensive \n body care set" , style: TextStyle(color: Colors.grey, fontSize: 15),),
                        SizedBox(
                          height: 5,
                        ),
                        Text("\$ 25.00", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
        
            Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 9),
                    child: Text("Popular Product",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
        
                SizedBox(
                  width: 166,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Explore_Screen(),));
                    },
                    child: Text("View More", style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),))
              ],
            ),
        
            SizedBox(
              height: 5,
            ),

            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Carts(image: images[index],
                        text1: heading1[index],
                        text2: heading[index],
                        price: price[index]),));
                  },
                  child: card_list(
                    image: images[index],
                    heading: heading[index],
                    heading2: heading1[index],
                    price: price[index],
                    
                  ),
                );

              },),
            )



          ],
        ),
      ),


      drawer: Drawer(
        width: 300,
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8PDxAPEBAPEBAQDw8PDw4PDRAPDw8QFhUXFhUVFRUYHSggGBolHRUVITEhJSorLi4uFx8zODMtNygtLisBCgoKDg0OFxAQGi0lHR0tLS0tLS0tLS0tLSsrLS0tLS0tLS0tLSstKystLS0uKy0rLS0tLS0rKy0tLS0tKy0tLf/AABEIAQQAwgMBIgACEQEDEQH/xAAcAAAABwEBAAAAAAAAAAAAAAAAAQIDBAUGBwj/xABGEAACAQMABwMIBwUHAwUAAAABAgADBBEFBhIhMUFRE2FxByIygZGhsdEUI0JScoLBM2KSk7JDU1RzlOHwNKLSFRYkY4P/xAAZAQEBAQEBAQAAAAAAAAAAAAAAAQIDBAX/xAAjEQEBAAICAgICAwEAAAAAAAAAAQIRAxITITFRBEEiMmEU/9oADAMBAAIRAxEAPwDqcMCHiGBODYYh4hgQ8ShOIeIrEGICcQ8Q8Q8QEwovELEBOIWIvELEBGIREcIiSICIkiOERJEimyIgiOkRDCZUywjbCPERthIGGEaYSQwjTCRUdhGXEksIy4kUxBFYghWpxDAh4hidnIMQ8QYh4gDEGIcOUJxDxDxBiAWIWIrEGICcQYioMQEYhERZEIiQNkRJEcIiSJA2REkRwiIIkU0wjbCPMI2wkUwwjTCSGEZYTKmGEZcR9xGmEimIIrEEitTiHiCGJ6HEAIcEMCAMQYhw8QCxBiHiDEAoIrEGIUmFiKgxATiERFQYgNkQiIsiJMgbIiSI4REkSKaIjbCPMI2wmVhhhGmEkMIywkVHcRhhJLiMuJlTOIUViCRWoghiHPQ4hiHiCHALEPEEOFFDghygoIcEgKFiKhRoFiFFQiICYkiLiTIEERJEcMQZA2wjbCPERthJVhlhGWEkMIy8y0jsIw8ktGHEysMwQ4JFaeHBBPQ4hFQocKEOCHKgocEOAUEOFAKCHBAKEYqFCkmJMXEmZCTEmLMSYDZiGEcMQ0zVMsIy4khoy0zWojuIy4khhGXEzVhjEEViCRWkhiFFT0OIQ4IcoEOCCAIIcEoKCHBAQ7hRknAjf0hTwyfBTG9I0yyED4ZiNDnFFFOQy7QIO4+kd+Om8S6RLVs8iPEQGKjb1FHFgPEzKjhGI+kJ94erfFg5ksUkxJizEmQIMQwjhiDJQ00ZaPsI0wma1DDxhxJDRlxMVoxiCKxBIrRQxCEMT0OIxDgEMSgQ4lWB4HOCQfERQgCHBBKBBBEu2IRT6ZPmH1yh1UGL499u/wDWs1F5QRxhmI8JU21vStqvbKSxCFMEj0Sc+3dNW+hpcTPaRyt1Qb7JqqG4/a3DI8SJdGsHpq6nc2CD3TC633tVfRqVF3/ZqMPgYk9DfBQOQHqglRqhUZ7G3ZiWJRssxJJ89hvJluZiqSYkxUIzKkGIMWYgyUNtGmjzRlpmtQy8ZePtGHmK0bghwSC/ihCjN/eJb0aleocJSQux54HId54T0b05KjWvWqjo5BtDtKzjNOiDgkfeY/ZWcy0l5Q9I1iQKi0EP2aKYbH4jk+zEodO6VqXVepXqHznYkDO5V+yo7gN0qHeeLLlyyvr4TbsHko1j7dKtpUYmqrPXpljkujHz9/Mhjn806JPNmrWkmtby2rg42KybXQ0ydlx/CTPSDVlCmptDYCliwORsgZJno4Mv46+gpmABJIAAySTgAd8asrpK1NaqEMjjKsOBGeInB9btdLnSLvss1O0DYpUFOA45NU+8TxxwHvnUvJZX29FUATko9ZD3YqMQPYRNY8nbLUas9NbIt02G/L+pkqQ7z0vyj4mdWVZeViM8PZKqrUJB4ewSfeytPAzllWpF/oUn6NTDbvSPqLEj3GVWndB0q/pVSPwqP1llSfFJP8tP6RKbSVyw5zp21E1tZ6t1adFKdmGJKB9hjjLbyxGOu8+yXpmD0HVJvKOfvn+lpvDJjdrZomJMUYRgIMQ0WYhpmhtoy0eaNNM1YZaNPMnrNrayFqVsRlchqxG1v5hBw9c5zpTSNeoxL1ajHvqN8OU4Zck3qFz07biHPP30yt/e1f5r/OCO6eR6gExXlYuylnTog47asNrvRBn4lZtROeeWGg/Z21YAlENWmx5KzbJXPjsmdub+lRye4eRMw61TJPSNBp5ZGEmgu0yjqwHtM6bQ069G2vqQJNP6DcMByVwuAR0zn4Tn+r9uXqdoR5qcO9uU22sdibPRNWpVGzXvmpW9FD6S0toO5PTIX4Rjvt6/TUYK3T6temM+JnU/IlellvKGdyPSqr3bQKn+gTk9Z9wUHzQMCdk8jWg3oWtS5qKVa6ZdhSMHsUzsn1lmPhideGXvtu/Docg3vpflHxMnSDfel+UfEz2VhTXsrWO4yxvTK1uBnDNuLtP2Sf5af0iUWk5eJ+yT/LT+kSi0nNZfCQxoD/q6H4z/AEtOgGYHQP8A1VH8Z/pM1+mtK07Skaj7zwRB6Tt0HzjG6ltMvlNMSZzHSOtl3UJIqGkvJKYAwPHiZEoa3X1I57YuPu1VDD28ffOV/Jx+k26sYhpjtE+UKg5C3KGi3DtFy9I+PNffNdSrK6h0YMrDKspBBHcZvHPHL4UGmb100obe2wpw9U9mp5qMecfZu9c0bTBeVAkC2PL672+ZM8t1jS/DD1WyJUXUlmvI1dfnPJHKoOzBHdmFN7HqASp1nu7anbOtyA6VFKiid5qeHTlv5Tl+kNe71ldaVZkpE+YxCGqF6bYH+/fM19Pq1KoepUeo2cFndmOOmSZ1y/IlmpG7dI2kdEAHNNt33W3++J0Zq/UrVEpjzmc4VE9Jj4nh4zZavao3N8Q+Oyo/3rg7x+4PtfCdS0Jq7bWabFOmCxxt1HAZ39fIdwmcOPLI0p9UdSqVmq1K2w9UDKrxp0vD7zd8w3lI0h9MvMZzRt9pKYB9JvtN7p1HTIpW1CtX7NCNjeNkb3Pmr7yJxe4p5JMx+Tl0kwxVFt6IXgo9gnUtV9cV2EpXbYYblrAbscg4HA985za08nfyk2onOefj5csLuI7gjAgEEEEZBByCOsg358/8o+JkPUna+gUNvjh8fh222fdiStInz/yj4mfXxy7Yy/YxutemRQZUXecq9TuTPDxOD/wx1XDJkbwRkHqDKzWbRFWpWd0wVfB3krskKF9m6TbKj2dFaec7CKueuBiePtlcsttRo6f7JPwJ8BM3pe5UVFpZ85snHcBnfL2tW2LbbxnYo7WOuEzic0as/b06hO0xqrtHqWOG9xnTl5eup9ptt9A0D29E/v8A6GDT+rd7d3NSoK1LscjsQ7NlVwMgKFxxzzk7Qo+tpfi/Qy1q7szrOOZzVMmOOoVxzr0v4XMaqag3HKtRPiHH6GXWk6zDOGYeDETHaUruScux8WJl/wCXjRF01q3XtV2qjUWGcfV1QWH5Tg+wSTqNrC1rXWg7E0KzBcE/s3O4MOgJ4ync7m8P1Eh0qTVKtNEB2nqIq46kgTx8uE4s51R3lpm9edDtd2jBBmrTPaUxzbdvUeI+AmiqMFGWIHLJOJEq1y25cgf3hU4Hh1+E9GerNV1k24ACQTkYIJBB4gjjJKgEb51+61WsqoO3S2mIx2mSr+ORjfM1eeTlCT2d3VUcldFfHrGJ5rx5M+NhPoZ6QTcDyb2/Ovc55/WJ/wCMEdMjxufUKxXdxU8VPP8A3jtCoAQd+45G6QlaSabhePH7ufjGUcdu3aM8oOj6lPLtUoFVGQ9E4JxvClM58N0mXGt1u1m91QYv5xpIGpuv1vQ5HIHa8BOFGuW692OXhOuaG1OLaNWhUqVKddtquFONhKrDdkAZOFwDv6907Y8mdlkdJdste3NWsS1WrUcnf59RiPUOA9UjqyDv8BI1W3qUar0qm50Yqw2toZHQx8MNwwCT1ni7+/YkJXpx3aotuO7vXA9xlXVtXwSoJ5gbsyCXqDP1dTdxwhl+TbsmidZbEU6dPbNEIqoBUBC4Ax6Y3e3ElX1ZXYMjKylBhlYMp3nmJxVHrY2glQd+DiHbaVr0j5rPTP7rYz3Ec/XPTj+TZ6sHT79pXhtxlBojWV67ijVwzNnZcDByBnBA3cj0l0Dumu8ym43F+u+ko/cXkOgmdqaIoo4dUGQcjecA9QOE0FM/Vr+BfgJX3PGdcpLraRM0R+1pfjEmVFYZ4H2TMadrMlpWZWKsKT4ZSVYHHIjhNOh+rT8C/CXDL9FU+kGODlV/iI/WZXSCAnl6mPzmp0nwMyd8d5l7VqRX/QmqHs6a7Tv5qja4nI5kzXap6mVreotxWdVdc7NNQKmMjGSTuz4TI1Xxv75f0PKItnbMLgNVqqB9HUHDVTwwx5Afe+Jnnz6+STJm6lbs0SvnOe1xk7TYUoO4cPhKm41u0ahKveW4YHDL2gYg9DjM4lrBrhfX7HtqxFM8KFMlKQHTA9LxOZRFpvbN5Hd77X/RdEbrjtei0abufbjHvlK/lWss4FC6x97ZpfDbnICTCBhPJXZR5TNHdLj+SPnBOOZgkPJVkKmOHt+Uet6ZbgCfAZiVtlBHPxl1Z02K4XcAM8h7pje/hjSx1Tq21vXFavSFQ0xt0wz4VXH2m3b8cuQ790d01rreXNV2Sq9GmSNhKbFCqjOMsN+Tkk+PdKW92iNkAlj6WN5x0/50jVKyqcwB4kTG8tadL6mkhLpySSxYk5JYkknvJk6jWYjJIVRxYnCj1yPQobPHYz13t8cCNaSpvUVUBJyd+ByHD4zEx3SRLradpoNlCah5bIOD6z8o7ZtdMDWdVSny20LE+G/dLXVDVVQRUqDOOs2GkNHI6bOAFA9k6+K2OmnML3Te/Z2d3WR6V4jfax8PYZp7zVaiSSAzesqsz99qzcf2a+AG+TozeOpNjW7J9sKjNjG1jDY7ppbXSquAN4f7mCST3dZlrHVDSh4U1A/+yoFl1b6naT5tbL3dvUPu7PEswznwS2N3bP8AVpxHmLuIwRu5gjdIly//ADd8o3oLRl3SyLirRqrjzQFYsG/GcEiW1XR1BuKZ/wD0qY+M9MlsVnnuk2lV9kqTgq4BUjoQdxmjW4UoCOGBjpiR6eh7RTtdhSLDgxXaI8CYqtag+g70/wB0bLL7GBx6iImNi3St0lUXB3/GZLSB3nfNbd6KruPNuaY72tdr4OJR3mqNxU43yLn7lpj41DLqijs6IrVBS2xTzk7bDI3DhiV+ktQr6rU7RKttWU4xiqyMF6AEY98u6fk82X22vqznpsIgl7ZaP7AAbTtjqQZLhN7S47cv0rq1cW+TUt6qIM+ev1iAd7AkD1yoNofskH3Gd27XAxk+sznuu+hUTNzRULv+uRR5u/7YA4d/jmc8uOybjGWEYN0I4jB6GJAk4sGGCMiRnp7J6g8JiZbc7NE7BhRWz4wSjqWsmgDSqVKlKir03YsFpjzkzxAHTwmVe6VWClXQ5xhqbr6uEytreXCHNO4r0+5KjAewNvl5ZaXuGIV6zuG807RHA7prLDGe46T3VhbvTZyQ7BySMqjPkDgCAN/X1mHcXFSmcOlTBPmt2bqG/iAx4S40frtc0lCtTosFGzjYKHduxuMh6d1j+mKoNJabKxPm1XqAjgOIGPfMdZf2tyntXPfY6ybojStJGDVUcgH7OyT7yJVJSz0i2p4k1IxMrHWNAaes7gbFF8OBk0nXZqY5kA+kO8ZlqRtcfZOGpUem61KZKuh2lYbiDOg6F1x7VFDKO0wNrkM8yJ2xy36dMMtteLcc/byi1VAeAlSulWPLjzzFi+6gzU1HRatcgcDEm6A55MpHu88d3cI2tyBnfL2TS/FxCNyZQ1tJYHGMtpI4wD7ZexpoKl6Fldc6a2TjHPHGQXvRjjvxwxzldWcPmTa6WlbT/ALxO4buHUwJfORnrwmcYspUsy4Azx4+qM6Q0y+zilgHqRk47o2aX1xpKomcsvAnPhKa71oZdw3nx5zO3GkajcTvO48MCRmJdgBnPMnhnulSrq51jqYIDeceYjI0szU2R8sGBDAnkZU1bcqd5B644RyjgDJMaTamqp2blScj9OXriKwbKqFZmPBVUkkdwE0ujNHJfFuzWixRtktU7YH1FSARNNoPRNXR5Ltsmk2FYU9olMnc2/Jxnp1zOXj97/Tnrfpz8aIvDv8Aolz/ACX+UE7R9IHR/wCW/wAoJ08U+2eriY0cuch6g/d8z5ZjptsDAz6+M6e3k90ed/8A8j1Vz8oseT+x+9c/z/mI8WZpzemO1BOfPGO0XqeG2O4/HMUKRHL2Toq+T21Dh1q3GRwBanjwJCSdo7UmyXJqUmd8ne9xWZWHI7O1sj2cpjxZbaykvty8VAu8nHiCIxUvEJ9Nf4gZ2630LaUvQtrdT1FFM+3GZOXA4ADwE34P9Z04LSV2/Z0qtU9KaM4/7RNFq3qfdVwxYV7RhvV3QBD4IcN751sMesWJrHi1flZ6cu0hqfptRild0qg69n2bfEyg+haxWrEnbqjiVZRVT1Y3j1TuME30jXZxmz1vuE82+tHU/wB7RRsfmRju9RPhJVHW6wc47Y0z0qU3Qe0jE60yKeIB8QDI9TR9BvSo0W8aSH9JPHGu7m3/AKpbVcbFxRbwqLHu1XHpL/EJu30FZHjaWx8ben8oj/29Y/4O0/01L5R417sLVvKQHnVEHi4lXd6ftUG+sp7gczpp1esP8Haf6al8oBoKyHC0th4W9P5R407uJ3WtlHJ2M+JEhnTz1D5tOo3gjGd8TR1uvo0aS+FJB+keFNRwUDwAE10jPauF0ncgFqeMjO8jMJqzLwp5/OAJ0fWLVR6lRq1DZO2SzU2Oydo8dk8N/fiY6/0ZUon62lVp95QlP4hunmyyuN9w3VK9K4q/2tvQXvNWo/sVcRVLV+g37fSFRu6nbuB75IKpyZfaIkqo+2g/MJZys7rZ6pW+jqCinRrlmJ/tcozHuyAPZNFpa8pW9JmqbwRshN205PICcmavSXi4PgIS3hqN9VTq1mP3EZj7prybmjbYrrbVAACqQAACck4HU9YczQ0VpA7/AKFV9qj9YJjrkvauyiHmFAZ60LVo4GkcGLBgO5gzEZh5gOrHAYwpiwYDuYMxvMG1AXCidqDMKMwjBmFmUCETDiTAImJMBMSTAESwzDEViQVlzoK0qnL29Bj1NFM+3EitqrYf4Wh/LEvsRt5nU+hTU9AWaHK21AHr2KZ+EmKiqMKAB0AAEdcxpjNSQDMETmCUWGIlouIeZCIoGIihKhwRYiFjgEACKEICLAgFBFYiGgDMGYgwZlC8wswiYkmA4DCMSphmAhjEEw2iDAWhjsZpx3MlUDGahjpMZqSBljGWMdeMtNIKCJhyqs4hoIJgIhiCCVDiR4Q4JAYihBBCjjbQQSobMIQQShUQYIIClhmCCA20bMEEoVTjsEEzVJaNPBBIGHjLQQTSEZggglH/2Q==")),
          ),

          child: StreamBuilder(
              stream: uServices.fetchUser(uEmail),
              builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
                if(snapshot.hasData){
                  var userLength = snapshot.data!.length;

                  return ListView.builder(
                    itemCount: userLength,
                    itemBuilder: (context, index) {

                      UserModel userData = snapshot.data![index];

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(userData.username!),
                              subtitle: Text(userData.useremail!),

                            ),

                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),

                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.double_arrow_sharp,color: Colors.black),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      child: Text("Update setting", style: TextStyle(color: Colors.black),)),
                                  SizedBox(
                                    width: 110,
                                  ),
                                  IconButton(
                                      style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                                      ),
                                      onPressed: () {

                                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            User_Update(),));

                                      }, icon: Icon(Icons.update, color: Colors.teal,))
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.double_arrow_sharp,color: Colors.black),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      child: Text("Delete setting", style: TextStyle(color: Colors.black),)),
                                  SizedBox(
                                    width: 115,
                                  ),
                                  IconButton(
                                      style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                                      ),
                                      onPressed: () {

                                        uServices.UserDelete(userData.userID!, context);

                                      }, icon: Icon(Icons.delete, color: Colors.red,))
                                ],
                              ),
                            ),

                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.double_arrow_sharp,color: Colors.black),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      child: Text("Login An Other Account", style: TextStyle(color: Colors.black),)),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  IconButton(
                                      style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                                      ),
                                      onPressed: () {

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => User_Login(),));
                                      }, icon: Icon(Icons.login, color: Colors.green.shade700,))
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.double_arrow_sharp,color: Colors.black),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      child: Text("Create New Account", style: TextStyle(color: Colors.black),)),
                                  SizedBox(
                                    width: 72,
                                  ),
                                  IconButton(
                                      style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                                      ),
                                      onPressed: () {

                                        Navigator.push(context, MaterialPageRoute(builder: (context) => User_Register(),));
                                      }, icon: Icon(Icons.how_to_reg_outlined, color: Colors.blue.shade700,))
                                ],
                              ),
                            ),
                            Spacer(),

                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),

                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.double_arrow_sharp,color: Colors.deepOrange),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      child: Text("Logout setting", style: TextStyle(color: Colors.deepOrange),)),
                                  SizedBox(
                                    width: 118,
                                  ),
                                  IconButton(
                                      style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10, vertical: 10))
                                      ),
                                      onPressed: () {

                                        uServices.UserLogout(context);

                                      }, icon: Icon(Icons.logout, color: Colors.deepOrange,))
                                ],
                              ),
                            ),


                          ],
                        );
                    },);


                }else if(snapshot.hasError){
                  return const Icon(Icons.error_outline);
                }else{

                  return Center(child: const CircularProgressIndicator());
                }
              }),
        ),


      ),

    );
  }
}


