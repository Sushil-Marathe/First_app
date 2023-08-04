import 'dart:ffi';
import 'dart:js_interop';

import 'package:firstapp/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(
          context, Myroutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(appBar: AppBar(),
          body: SingleChildScrollView(
              child: Form(

                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login_image.png",
                      fit: BoxFit.cover,
                    ),
                    TextFormField(),
                    SizedBox(height: 40.0,
                    ),
                    Text("Welcome $name",
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                        padding:
                        const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Enter Username",
                                labelText: "Username",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username cannot be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                name = value;
                                setState(() {});
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Password",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                } else if (value.length < 6) {
                                  return "Password length should be at least 6";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Material(
                                color: Colors.red,
                                borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 7),
                                child: InkWell(
                                    onTap: () => moveToHome(context),
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 1),
                                      width: changeButton ? 50 : 150,
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: changeButton
                                          ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                          : Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.amber,

                                      ),
                                    )
                                )
                            )
                          ],
                        )
                    )


                  ],

                ),
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
