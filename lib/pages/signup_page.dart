


import 'package:blog_app/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthController authController=Get.put(AuthController());
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        
        children: [
          const SizedBox(height: 50.0,),
           Container(height:Get.height*0.5,
           width: Get.width*0.9,
           
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Text('Sign Up',style: TextStyle(color:Colors.black,fontWeight:FontWeight.w700,fontSize:30),),
               const SizedBox(height:5.0),
               const Text('please sign Up to continue',style:TextStyle(color:Colors.black38,fontSize: 16)),
              const SizedBox(height:5.0),
               //form
                Form(
                  key: formKey,
                  child: Expanded(
                    child: ListView(
                      children: [
                        TextFormField(
                      validator:MultiValidator(
                        [
                          RequiredValidator(errorText: "required field"),
                          EmailValidator(errorText: "invalid email address")
                        ]
                      ),  
                     controller: authController.emailController,
                     decoration: const InputDecoration(label: Text('Email'),focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       width: 1.0,
                       color:Colors.blue,
                       style: BorderStyle.solid
                     )
                 ),
                 
                 ),),
                 const SizedBox(height:20.0),
                 TextFormField(
                   validator: MultiValidator([
                     RequiredValidator(errorText: "required field"),
                     MinLengthValidator(6, errorText:"password must contain atleast 6 charcaters")
                   ]),
                 controller: authController.passwordController,
                 decoration: const InputDecoration(label: Text('Password'),focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       width: 1.0,
                       color:Colors.blue,
                       style: BorderStyle.solid
                     )
                 ),
                 
                 ),),

                 const SizedBox(height:10.0),

                  TextFormField(
                   validator: (val)=>MatchValidator(errorText:"password mismatch" ).validateMatch(val!,authController.passwordController.text),
                 
                 decoration: const InputDecoration(label: Text('Password'),focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(
                       width: 1.0,
                       color:Colors.blue,
                       style: BorderStyle.solid
                     )
                 ),
                 
                 ),),
                      ],
                    ),
                  ),
                ),

                 const SizedBox(height:15.0),

                 Row(
                   children: [
                     Expanded(
                       child: Container(),

                     ),

                     InkWell(
                       onTap: (){
                         if(formKey.currentState!.validate()){
                           authController.onSignupSubmit();
                         }

                       },
                       child: Container(
                         height: 37,
                         width: 100,
                         child: const Center(child: Text('Sign Up',style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600))),
                         decoration: BoxDecoration(
                           color: Colors.orangeAccent,
                           borderRadius: BorderRadius.circular(5)
                         ),
                       ),
                     )
                   ],
                 )
             ],
           ),
           
           
           ),
          Expanded(child: Container(),),
          // RichText(text: const TextSpan(children:[
          //   TextSpan(text: 'Dont have an account  ',style:TextStyle(color:Colors.black54)),
          //   TextSpan(
              
              
          //     text: 'Sign Up',style: TextStyle(color:Colors.black,fontSize:18,fontWeight: FontWeight.bold))
          // ] ),),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
           const Text('already have an account  ',style:TextStyle(color:Colors.black54)),
          GestureDetector(
            onTap: (){
              
              Get.offNamed('/login');
            },
            child: const Text('Login',style: TextStyle(color:Colors.black,fontSize:18,fontWeight: FontWeight.bold),))
          ],),
          const SizedBox(
            height:10.0
          )
        ],
      ) 
    );
  }
}