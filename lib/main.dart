import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Layout/screens/Entry_Page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

