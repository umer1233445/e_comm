import 'package:flutter/material.dart';
import 'package:umer/User/Controller/user_services.dart';

import '../Model/user_model.dart';

class User_Update extends StatefulWidget {
  const User_Update({super.key});

  @override
  State<User_Update> createState() => _User_UpdateState();
}

class _User_UpdateState extends State<User_Update> {

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  UserFirebaseServices uServices = UserFirebaseServices();

  UserModel userModel = UserModel();

  @override
  void initState() {
    // TODO: implement initState

    name.text = userModel.username!;
    email.text = userModel.useremail!;
    password.text = userModel.userpassword!;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("UPDATE USER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),

      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                label: Text("Enter Your Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                 prefixIcon: Icon(Icons.person),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                label: Text("Enter Your Email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Enter Your Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                prefixIcon: Icon(Icons.password),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Center(
            child: ElevatedButton(

              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.teal),
                fixedSize: MaterialStatePropertyAll(const Size(110, 30)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              ),
                onPressed: () {

            }, child: Text("Update", style: TextStyle(color: Colors.white),)),
          ),


        ],

      ),
    );
  }
}
