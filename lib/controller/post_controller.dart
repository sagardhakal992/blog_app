
import 'dart:io';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController{
ImagePicker? image=ImagePicker();
FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
var titleController=TextEditingController();
var descriptionController=TextEditingController();
var formKey=GlobalKey<FormState>();
File? file;
User? user;
FirebaseAuth firebaseAuth=FirebaseAuth.instance;
var imageUrl;

bool isNotImage=false;

selectFile()async{
var img=await image!.pickImage(source: ImageSource.camera);
if(img==null)return;
file=File(img.path);
update();


}

upload()async{
  if(file==null){
    isNotImage=true;
    update();
    return ;
  }
  var imageFile=FirebaseStorage.instance.ref().child('path').child(file!.path.split('/').last);
  UploadTask task=imageFile.putFile(file!);
  TaskSnapshot snapshot=await task;
  imageUrl=await snapshot.ref.getDownloadURL();

  await firebaseFirestore.collection('post').add({'image':imageUrl,'title':titleController.text,'description':descriptionController.text,'user':{'uid':user!.uid,'email':user!.email}});
   titleController.text="";
   descriptionController.text="";
   Get.snackbar('post created', "success");

}

@override
  void onInit()async {
    user=firebaseAuth.currentUser;
   
    super.onInit();
  }


}