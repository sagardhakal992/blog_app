

import 'package:blog_app/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BlogController extends GetxController {
FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
var firebaseAuth=FirebaseAuth.instance;
var initHeight=0.1.obs;
var data=[].obs;

   fetchPost()async{
     var datas=[];
    await FirebaseFirestore.instance
    .collection('post')
    
    .get()
    
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
            datas.add({'title':doc['title'],'description':doc['description'],'image':doc['image']});
        });
    });
   data.value=datas;
   
   

    
  }


logout()async{
  await firebaseAuth.signOut();
  await Future.delayed(Duration(seconds: 1));
  Get.offNamed('/login');
}

  


  @override
  void onInit() {
    if(Get.arguments==null){
  fetchPost();
    }
    else{
    //  detailData.value=Get.arguments;
    }
    
    super.onInit();
  }
}