

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class AuthController extends GetxController{
   TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();
   GlobalKey<FormState> formKey=GlobalKey();
   FirebaseAuth  firebaseAuth=FirebaseAuth.instance;
   var user;
  

  onSignupSubmit()async{
  
 try{
 var data=await firebaseAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
 Get.offNamed('/home');
 
 }
 on Exception catch(e){
   
      Get.snackbar("invalid email or password", e.toString());
 }
  }
 onLoginSubmit()async{
try{
var data=await firebaseAuth.signInWithEmailAndPassword(email: emailController.text, password:passwordController.text);
Get.offNamed('/home');
}

on Exception catch(e){
  Get.snackbar("invalid email or password", e.toString());
}

 }
  
  @override
  void onInit() async {
  
    var user=await firebaseAuth.currentUser;
    
    if(user !=null){
      
      Get.offNamed('/home');
    }
    super.onInit();
  }

  @override
  void dispose() {
    
    super.dispose();
  }
       
  }
