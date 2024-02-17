import 'package:flutter/material.dart';

import '../widgets/Log_Register_Widgets/LoG_IN_TextFormField.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInState();
}

class _LogInState extends State<LogInScreen> {
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
            child: Form(

              key: formKey,
              child: Column(
                children:[
                  Container(
                    alignment: Alignment.bottomCenter,
                      height: 320,
                      width: double.infinity,
                      child: Image.asset("assets/2.gif")),

                  Padding(
                    padding: const EdgeInsets.only(right: 18.0,left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("LogIn",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                            //fontFamily: "pacifico"
                          ),),
                        ),
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
                            Text("Don't have an account? ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15),),
                            GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushNamed("Register");
                                },
                                child: Text("REGISTER",
                                  style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                      SizedBox(height: 30,),
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black
                              ),
                              onPressed: (){
                            Navigator.pushNamed(context, "home");
                          }, child: Text("Log In")),
                        )
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

