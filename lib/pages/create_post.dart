

import 'dart:io';

import 'package:blog_app/controller/post_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class CreatePage extends StatelessWidget {
  var postController=Get.put(PostController());
  final url='https://image.shutterstock.com/image-vector/profile-photo-vector-placeholder-pic-260nw-535853263.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text('create new blog',style: TextStyle(color: Colors.black),),elevation: 0.0,backgroundColor: Colors.white),

      body: Container(
        
        child: Column(children: [
          Container(height: 200,
          child: Stack(children: [
             Align(
               alignment: Alignment.center,
               child:GetBuilder<PostController>(
                 builder: (controller) {
                   return Container(
                     height: 190,
                     width: 190,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: controller.file==null ? NetworkImage(url):FileImage(File(controller.file!.path)) as ImageProvider
                       ),
                       borderRadius: BorderRadius.circular(95),border:Border.all(width: 6,color: Colors.redAccent)
                     ),
                     
                   );
                 }
               ),
             ),
             Positioned(
               right: Get.width*0.5-100,
               bottom: 35,
               child:  IconButton(icon: Icon(Icons.camera_alt_outlined,size: 50,),
             onPressed: postController.selectFile,
             ))
          ],),
          ),
        //textform form starts here
        GetBuilder<PostController>(builder: (controller){
          return controller.isNotImage?Text('image required',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),):Text('');
        }),
        Form(
          key:postController.formKey,
          child:Expanded(
          child: ListView(
            
            children: [
              const SizedBox(height: 30),
              buildInputForm(label: 'title',line: 1,controller: postController.titleController,validator: [
                RequiredValidator(errorText: "required field"),
                MinLengthValidator(15, errorText:"at leat 15 character required")
              ]),
              const SizedBox(height: 30,),
              buildInputForm(label: 'description',line: 6,controller: postController.descriptionController,validator: [
                RequiredValidator(errorText: "required field"),
                MinLengthValidator(100, errorText:"at leat 100 character required")
              ]),
             const SizedBox(height:20),
              MaterialButton(onPressed:(){
                if(postController.formKey.currentState!.validate()){
                  postController.upload();
                }
              },
              child: Container(
                height: 60,
                color: Colors.green,
                child: const Center(
                  child: Text('Create',style: TextStyle(color: Colors.white,fontSize: 19),),
                ),
              ),
              ),
            ],
          ),
        ))
        ],),
      ),
    );
  }

  buildInputForm({String? label,int? line,var controller,var validator}){
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator:MultiValidator(validator) ,
                controller: controller,
                keyboardType: TextInputType.multiline,
                maxLines: line,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  label: Text(label!),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)
              ),),),
            );
  }
}