import 'package:blog_app/controller/auth_controller.dart';
import 'package:blog_app/controller/blog_controller.dart';
import 'package:blog_app/widget/comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var blogController=Get.put(BlogController());

  var data=['sagar','suraj','ravi'];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:SafeArea(
        child: Stack(
          children: [
            Container(
              color:Colors.white
            ),
            

            ListView(
              children: [
               buildNav(),
               const SizedBox(height:30),
                Container(
                  width: Get.width,
                  
                  margin: EdgeInsets.symmetric(vertical: 5),
                  
                  padding: const EdgeInsets.only(left:20,right: 60),
                  child: Text(Get.arguments.title,style: TextStyle(fontSize: 26,letterSpacing: 2,),maxLines: 3,),
                ),
                Container(
                  height:250,
                  width: Get.width,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(Get.arguments.image!),
                    fit: BoxFit.fill
                  )
                  ), 
                ),

                Text(Get.arguments.description,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                
                SizedBox(height: Get.height*0.1,)
              ],
            ),
            
             DraggableScrollableActuator(
               child: DraggableScrollableSheet(
                 initialChildSize: 0.08,
                 minChildSize: 0.08,
                 
                 builder: (context,scrollCintroller){
                 return Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                   ),
                   child: SingleChildScrollView(
                     controller: scrollCintroller,
                     child: Container(
                       decoration: BoxDecoration(
                     color: Colors.black12,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                   ),
                       height: Get.height*0.97,
                       
                       child:Column(
                         
                         children: [
                           Text('Comment'),
                           Icon(Icons.menu),
                          //  TextButton(child: Text('close'),onPressed: (){
                          //    DraggableScrollableActuator.reset(context);
                          //  },),
                           SizedBox(height: 15,),
                           Expanded(
                             
                             child: ListView.builder(
                               itemCount: 10,
                               itemBuilder: (context,i){
                             return commentWidget();
                           }))
                         ],
                       )
                     ),
                   ),
                 );
               }),
             )
            
          ],
        ),
      ),
      
    );

    
  }

  buildNav(){
    return Container(
                padding:const EdgeInsets.only(right: 15),
                height: 60,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  GestureDetector(onTap: (){
                    Get.back();
                  },child: Icon(Icons.arrow_back_ios_new),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget>[
                      const Text('Sagar Dhakal',style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                      const Text('post author',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black45),)
                    ],),
                    const SizedBox(width: 5,),
                    ClipOval(
                      child: Container(
                        height:50,
                        width: 50,
                        color: Colors.red,


                      ),
                    )
                  ],)
                ],),
                );
  }
}