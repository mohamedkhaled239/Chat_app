import 'package:chat_app/Screens/chatpage.dart';
import 'package:chat_app/Screens/registerscreen.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helpers/ShowSnakbar.dart';
import 'package:chat_app/widgets/custombutton.dart';
import 'package:chat_app/widgets/customtextfeils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});
      static String id ='LoginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloading=false;
  String? email,password;
  GlobalKey<FormState>formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor:  kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                   const SizedBox(height: 40,),
                  Image.asset('assets/images/scholar.png',height: 150,),
                  const Center(
                    child: Text(
                      "whatsapp ",style: TextStyle(fontFamily: 'pacifico',color: Colors.white,fontSize: 32),),
                  ),
                    const SizedBox(height: 50,),
                     const Row(
                     children: [
                      
                       Text("Login",style: TextStyle(color: Colors.white,fontSize: 24),),
                     ],
                   ),
                   const SizedBox(height: 16,),
        
                
                  CustomFormTextField(
                    
                    onChange:(data){
                    email=data;
                  },hinttext:'Email',
                   obscuretext: false,),
                   const SizedBox(height: 6,),
            
                  CustomFormTextField( onChange:(data){
                    password=data;
                  },hinttext:'Password', obscuretext: true,),
                   const SizedBox(height: 16,),
                   
            
                   CustomButton(
                    onTap:()async{
                      if (formkey.currentState!.validate()) {
                        isloading=true;
                        setState(() {
                          
                        });
               try{
                   await loginuser();
                      showSnackbar(context,"login successful.");
                      Navigator.pushNamed(context, ChatPage.id,arguments: email);

                  }on FirebaseAuthException  catch(e){
                  if (e.code == 'user-not-found') {
                    showSnackbar(context,'No user found for that email.');
                  }                 
                     else if (e.code == 'wrong-password') {
                  
                   showSnackbar(context,'Wrong password provided for that user.');
              
                      }
                      }
                   isloading=false;
                    setState(() {
        
                    });
                     }
                 
            
            
                    }
                     ,text: 'Login',),
                    const SizedBox(height: 8,),
                
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                       const Text('don\'t have an account?',style: TextStyle(color: Colors.white),),
                       GestureDetector(
                         onTap: (){
                        Navigator.pushNamed(context, ResgisterScreen.id);
                          
                        },
                          
                       
                        child: const Text('  Resgister',style: TextStyle(color: Color(0xffC7EDE6)),)),
                   
                    ],
                  ),
         
                ],
              ),
            ),
          ),
      
      ),
    );
    
  }
  Future<void> loginuser() async {
    UserCredential user=await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
  }
 
}
