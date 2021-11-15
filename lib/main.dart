import 'package:blog_app/pages/create_post.dart';
import 'package:blog_app/pages/detailpage.dart';
import 'package:blog_app/pages/home_page.dart';
import 'package:blog_app/pages/login_page.dart';
import 'package:blog_app/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      
      getPages:[
        GetPage(name: "/login", page:()=>const LoginPage()),
        GetPage(name: "/signup", page:()=>const SignUpPage()),
        GetPage(name: "/home", page:()=> HomePage()),
        GetPage(name: "/detail", page:()=> DetailPage()),
        GetPage(name: '/create', page: ()=>CreatePage())
        
      ]
    );
  }
}
