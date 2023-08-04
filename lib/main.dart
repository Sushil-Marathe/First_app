import 'package:firstapp/login_page.dart';
import 'package:firstapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        // ),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.lato().fontFamily,
      ) ,
      debugShowCheckedModeBanner: false,
      // initialRoute: "/home",
      routes: {
        "/":(context)=> LoginPage(),
        Myroutes.homeRoute:(context)=> HomePage(),
        Myroutes.loginRoute:(context)=> LoginPage()
      },
    );
  }
}
