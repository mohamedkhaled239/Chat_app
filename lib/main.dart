import 'package:chat_app/Screens/chatpage.dart';
import 'package:chat_app/Screens/loginpage.dart';
import 'package:chat_app/Screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}
class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id :(context)=>  const LoginPage(),
          ResgisterScreen.id :(context)=>  const ResgisterScreen(),
          ChatPage.id : (context)=> ChatPage(),
      
      },
      initialRoute: LoginPage.id,
    );
  }
}