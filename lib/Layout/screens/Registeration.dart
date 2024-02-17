import 'package:flutter/material.dart';

import '../widgets/Log_Register_Widgets/LoG_IN_TextFormField.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey=GlobalKey();
    String? email,password;
    bool isloaded=false;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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
                      SizedBox(height: 10,),
                      TextFieldLogIn(
                          hintText: "Nsme",
                          onchange: (data){
                            email=data;
                          }),
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

                    ],
                  ),
                ),
              ],),
          ),
        ),
      ),


    );
  }
}
