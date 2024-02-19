import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/Log_In_Button.dart';
import 'Entry_Page.dart';


class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInState();
}

class _LogInState extends State<LogInScreen> {
  GlobalKey<FormState> formKey=GlobalKey();
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
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
                          TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: password,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),

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
                         // Spacer(flex: 1,),
                          Center(
                            child: buttonItem(
                              text: "Login",
                              ontap: () async {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    isloaded = true;
                                  });
                                  try {
                                    await login();
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                                  } catch (error) {
                                    setState(() {
                                      isloaded = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("An error occurred. Please try again later."),
                                      ),
                                    );
                                  }
                                }
                              },
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
  // Future<void> LogInAccount() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: email!,
  //     password: password!,
  //   );
  // }
  //
  //
  // void showingSnapBar(BuildContext context,String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content:
  //     Text(message),),);
  // }
  Future<void> login() async {
    final String emaill = email.text.trim();
    final String passwordd = password.text.trim();
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emaill, password: passwordd);
    }
}

