import 'package:chat_app/Screens/chatpage.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/helpers/ShowSnakbar.dart';
import 'package:chat_app/widgets/custombutton.dart';
import 'package:chat_app/widgets/customtextfeils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class ResgisterScreen extends StatefulWidget {
  const ResgisterScreen({super.key});
  static String id = 'ResgisterPage';

  @override
  State<ResgisterScreen> createState() => _ResgisterScreenState();
}

class _ResgisterScreenState extends State<ResgisterScreen> {
  String? password, email, phone;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 150,
                ),
                const Center(
                    child: Text(
                  "whatsapp",
                  style: TextStyle(
                      fontFamily: 'pacifico',
                      color: Colors.white,
                      fontSize: 32),
                )),
                const SizedBox(
                  height: 90,
                ),
                const Row(
                  children: [
                    Text(
                      "Resgister",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                /*CustomFormTextField(
                    onChange:(data){
                    phone=data;
                  },hinttext:'phone', obscuretext: false,),
                                     const SizedBox(height: 6,),*/

                CustomFormTextField(
                  onChange: (data) {
                    email = data;
                  },
                  hinttext: 'Email',
                  obscuretext: false,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomFormTextField(
                  onChange: (data) {
                    password = data;
                  },
                  hinttext: 'Password',
                  obscuretext: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomButton(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await RegisterUser();
                        showSnackbar(context, "Email Created.");
                        Navigator.pushNamed(context, ChatPage.id);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackbar(context, 'weak-password');
                        } else if (ex.code == 'email-already-in-use') {
                           showSnackbar(context,
                              "The account already exists for that email.");
                        }
                      }
                      isloading = false;
                      setState(() {});
                    } else {}
                  },
                  text: 'Register',
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already you have an account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, "ResgisterPage");
                      },
                      child: const Text(
                        '  Login',
                        style: TextStyle(color: Color(0xffC7EDE6)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> RegisterUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
