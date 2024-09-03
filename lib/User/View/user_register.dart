import 'package:flutter/material.dart';
import 'package:umer/User/Controller/user_services.dart';
import 'package:umer/User/Model/user_model.dart';
import 'package:umer/User/View/user_login.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v1.dart';

class User_Register extends StatefulWidget {
  const User_Register({super.key});

  @override
  State<User_Register> createState() => _User_RegisterState();
}

class _User_RegisterState extends State<User_Register> {

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  UserFirebaseServices uServices = UserFirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register User"),
        backgroundColor: Colors.blue,

      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 29,

          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 1.0),
                ),
                hintText: "Jhon Nick",
                label: Text("Enter Your Name"),
                prefixIcon: Icon(Icons.person),

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 1.0),
                ),
                hintText: "Jhon@gmail.com",
                label: Text("Enter Your Email"),
                prefixIcon: Icon(Icons.email),

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 1.0),
                ),
                hintText: "123456",
                label: Text("Enter Your Password"),
                prefixIcon: Icon(Icons.password),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
          ),

          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                    fixedSize: MaterialStatePropertyAll(Size(110, 28))
                  ),
                  onPressed: () {
                    uServices.UserRegister(UserModel(
                      userID: Uuid().v1(),
                      username: name.text,
                      useremail: email.text,
                      userpassword: password.text,
                    ), context);

              }, child: Text("Register", style: TextStyle(color: Colors.white),)),
            ),
          ),

             Center(
               child: Container(
                 margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                 child: OutlinedButton(
                     style: ButtonStyle(
                         backgroundColor: MaterialStatePropertyAll(Colors.green.shade700),
                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                         fixedSize: MaterialStatePropertyAll(Size(90, 28))
                     ),

                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => User_Login()));
                 }, child: Text("Login", style: TextStyle(color: Colors.white),)),
               ),
             ),

        ],
      ),

    );
  }
}
