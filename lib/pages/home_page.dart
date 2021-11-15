


import 'package:blog_app/controller/blog_controller.dart';
import 'package:blog_app/model/post.dart';
import 'package:blog_app/widget/post_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  var authController=FirebaseAuth.instance;
  var blogController=Get.put(BlogController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed:blogController.fetchPost,icon: Icon(Icons.restore_outlined,color: Colors.black,),),
        title: Text('BlogSy',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          TextButton.icon(onPressed:(){
            Get.toNamed('/create');
          }, icon:Icon(Icons.add), label:Text('new post')),
          IconButton(onPressed:blogController.logout, icon:Icon(Icons.logout,color: Colors.black,))
        ],
      ),
        body:Obx((){
          return blogController.data.isNotEmpty?SafeArea(
            child: ListView.builder(
            itemCount:blogController.data.length ,
            itemBuilder:(context,i){
              Post post=Post.toJson(blogController.data[i]);
             
            return postCard(post);
        }),
          ):const Center(
          child:  CircularProgressIndicator(),
        );
        })
    );
  }
}