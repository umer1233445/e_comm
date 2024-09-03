import 'package:flutter/material.dart';
import 'package:umer/User/Controller/user_services.dart';
import 'package:umer/User/Model/user_model.dart';
import 'package:umer/User/View/user_register.dart';

class User_Login extends StatefulWidget {
  const User_Login({super.key});

  @override
  State<User_Login> createState() => _User_LoginState();
}

class _User_LoginState extends State<User_Login> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  UserFirebaseServices uServices = UserFirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LOG IN"),
        backgroundColor: Colors.amberAccent,
        automaticallyImplyLeading: false,

      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 29,

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
                      backgroundColor: MaterialStatePropertyAll(Colors.green.shade700),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                      fixedSize: MaterialStatePropertyAll(Size(120, 28))
                  ),
                  onPressed: () {
                    uServices.UserLogin(UserModel(
                      useremail: email.text,
                      userpassword: password.text,

                    ), context);

                  }, child: Text("LOG IN" , style: TextStyle(color: Colors.white),)),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue.shade700),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                      fixedSize: MaterialStatePropertyAll(Size(107, 28))
                  ),

                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => User_Register()));
                  }, child: Text("Register", style: TextStyle(color: Colors.white),)),
            ),
          ),

        ],
      ),

    );
  }
}
