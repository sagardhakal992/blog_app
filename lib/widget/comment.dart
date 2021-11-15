


import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget commentWidget(){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Container(height: 50,width: 50,color: Colors.blue,),
        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sagar dhakal',style:TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black)),
            Text('3h ago',style:TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black45)),
            Container(
              width: 300,
              child: Text('you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?you always give good advices,what would you say to someone?',style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black87))),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: null, icon:Icon(Icons.favorite,color: Colors.red,),),
                Text('Like'),
                IconButton(onPressed: null, icon:Icon(Icons.message_outlined)),
                Text('Comment'),
              ],
            )
          ],
        )
      ],
    ),
  );
}