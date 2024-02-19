import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'Entry_Page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey=GlobalKey();
  final TextEditingController  email =TextEditingController();
  final TextEditingController password=TextEditingController();
  bool isloaded=false;
  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: isloaded,
      child: Scaffold(
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
                        // SizedBox(height: 10,),
                        // TextFieldLogIn(
                        //     hintText: "Name",
                        //     onchange: (data){
                        //       email=data;
                        //     }),
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
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black
                            ),
                            onPressed: isloaded ? null : _register,
                            child: isloaded
                                ? CircularProgressIndicator()
                                : Text('Register'),
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
  Future<void> _register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isloaded = true;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        // Registration successful
        // You can navigate to another screen or show a success message
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _showErrorDialog('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          _showErrorDialog('The account already exists for that email.');
        } else {
          _showErrorDialog('Error: ${e.message}');
        }
      } catch (e) {
        _showErrorDialog('Error: $e');
      } finally {
        setState(() {
          isloaded = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  // Future<void> registerUser() async {
  //   UserCredential user = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email!, password: password!);
  // }
  // void showingSnapBar(BuildContext context,String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content:
  //     Text(message),),);
  // }
}
