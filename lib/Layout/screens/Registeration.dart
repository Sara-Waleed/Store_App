import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/Log_In_Button.dart';
import '../widgets/Log_Register_Widgets/LoG_IN_TextFormField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey=GlobalKey();
  String? email,password;
  bool isloaded=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: ModalProgressHUD(
            inAsyncCall: isloaded,
            child: Form(
              key: formKey,
              child: Column(
                children:[
                  Container(
                      alignment: Alignment.bottomCenter,
                      height: 300,
                      width: double.infinity,
                      child: Image.asset("assets/Logo Animations - Collaboration Vol_ 2.gif",width: double.infinity,fit: BoxFit.cover,)),

                  Padding(
                    padding: const EdgeInsets.only(right: 18.0,left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("Register",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                            //fontFamily: "pacifico"
                          ),),
                        ),
                        // SizedBox(height: 10,),
                        // TextFieldLogIn(
                        //     hintText: "Name",
                        //     onchange: (data){
                        //       email=data;
                        //     }),
                        SizedBox(height: 10,),
                        TextFieldLogIn(
                            hintText: "Email",
                            onchange: (data){
                              email=data;
                            }),
                        SizedBox(height: 10,),

                        TextFieldLogIn(
                            obscureText: true,
                            hintText: "Password",
                            onchange: (data){
                              password=data;
                            }),

                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(" You've already an account? ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15),),
                            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Log In",
                                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                          ],
                        ),

                        // Spacer(flex: 1,),
                      SizedBox(height: 20,),
                        Center(
                          child: buttonItem(
                            text: "Register",
                            ontap: () async {
                              if (formKey.currentState!.validate()) {
                                isloaded = true;
                                setState(() {});
                                try {
                                  await registerUser();
                                  Navigator.of(context).pushNamed("login", arguments: email);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == "User_Not_Found") {
                                    showingSnapBar(context, "The password provided is too weak.");
                                  } else if (e.code == 'email-already-in-use') {
                                    showingSnapBar(context, "The account already exists for that email.");
                                  }
                                } catch (error) {
                                  showingSnapBar(context, "An error occurred. Please try again later.");
                                }
                                isloaded=false;
                                setState(() {});
                              }else{}
                            },
                            // Disable button when isloaded is true
                          ),
                        ),
                      ],
                    ),
                  ),
                ],),
            ),
          ),
        ),
      ),


    );
  }

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
  void showingSnapBar(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Text(message),),);
  }
}
