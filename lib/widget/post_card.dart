
import 'package:blog_app/model/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget postCard(Post post){

  return Container(
    height:Get.height*0.7,
    width: Get.width,
    margin: EdgeInsets.only(bottom: 15 ),
    
    child: Column(
      children: [
        Container(
          height:80,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                height: 60,width: 60,decoration: BoxDecoration(image:DecorationImage(image:NetworkImage(
                'https://images.thequint.com/thequint%2F2018-11%2Fba29008d-9860-46ef-b319-9d12030c51df%2F46118b30_698d_4c08_8f19_23ffac554d35.jpg?rect=0%2C0%2C600%2C338',
                
              ),
              fit: BoxFit.fill
              ),
              ),
              ),
              Text('mentalquotes',style: TextStyle(color:Colors.black,fontSize: 16),)
            ],

          ),
        ),
        SizedBox(height: 10,),

        Expanded(
          child: Container(
            
              decoration: BoxDecoration(image:DecorationImage(image:NetworkImage(
                post.image!
  ),
              fit: BoxFit.fill
              ),
              ),
            
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title!,style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
              Container(
                width: 400,
                child: Text(post.description!,maxLines: 4,
                style: TextStyle(color: Colors.black,fontSize: 18),
                ),
              ),
              TextButton(onPressed: (){
                Get.toNamed('/detail',arguments:post);
              }, child:Text('Read More'))
            ],
          ),
        )

      ],
    ),
  );
}