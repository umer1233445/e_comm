import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umer/User/Model/user_model.dart';
import 'package:umer/User/View/bottombar.dart';
import 'package:umer/User/View/fetch_screen.dart';
import 'package:umer/User/View/user_login.dart';
import 'package:umer/User/View/user_register.dart';

class UserFirebaseServices{

  final CollectionReference _userServices = FirebaseFirestore.instance.collection("UserData");

  void UserRegister(UserModel userModel, BuildContext context)async{
    try{

      FirebaseAuth.instance.createUserWithEmailAndPassword(email: userModel.useremail!, password: userModel.userpassword!);

      Map<String, dynamic>addUser= {
        "userID" : userModel.userID!,
        "userName" : userModel.username!,
        "userEmail" : userModel.useremail!,
        "userPassword" : userModel.userpassword!,
      };

       await _userServices.doc(userModel.userID).set(addUser);
       if(context.mounted){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Register")));
         Navigator.push(context, MaterialPageRoute(builder: (context) => User_Login(),));
       }
    }catch(ex){
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
      }
    }
}

Stream<List<UserModel>> fetchUser(String userEmail){
    return _userServices.where('userEmail', isEqualTo: userEmail).snapshots().map((snapshot){
      return snapshot.docs.map((doc) {
        Map<String, dynamic> uData = doc.data() as Map<String, dynamic>;

        return UserModel(
          userID: uData['userID'],
          username: uData['userEmail'],
          useremail: uData['userEmail'],
          userpassword: uData['userPassword']
        );

      }).toList();
    } );


}

static Future getUserCred()async{
    SharedPreferences userCred = await SharedPreferences.getInstance();
    var userEmail = userCred.getString("email");
    return userEmail;
}




void UserLogin(UserModel userModel, BuildContext context)async{

try{
  FirebaseAuth.instance.signInWithEmailAndPassword(email: userModel.useremail!, password: userModel.userpassword!);

  SharedPreferences userCred = await SharedPreferences.getInstance();
  userCred.setString("email", userModel.useremail!);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Login")));
  Navigator.push(context, MaterialPageRoute(builder: (context) => Bottom_bar(),));
} catch(ex){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something Went Wrong")));
}

}

void UserUpdate(UserModel userModel, BuildContext context)async{
   try{
     _userServices.doc(userModel.userID!).update({
       "userName": userModel.username!,
       "userEmail" : userModel.useremail!,
       "userPassword" : userModel.userpassword!
     });
    if(context.mounted){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Update")));
      Navigator.pop(context);
    }

}catch(ex){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something Went Wrong")));
   }
}

void UserDelete(String userID, BuildContext context)async{

try{
  FirebaseAuth.instance.currentUser!.delete();
 _userServices.doc(userID).delete();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Delete")));
  Navigator.push(context, MaterialPageRoute(builder: (context) => User_Register(),));
}
catch(ex){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something Went Wrong")));
    }
  }

  void UserLogout(BuildContext context)async {
    FirebaseAuth.instance.signOut();
    SharedPreferences userCred = await SharedPreferences.getInstance();
    userCred.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context) => User_Login(),));
  }
}