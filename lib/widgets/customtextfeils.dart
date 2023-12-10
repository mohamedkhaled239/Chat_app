import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
    CustomFormTextField( {super.key,   required this.hinttext,this.onChange ,required this.obscuretext} );
    Function(String)?onChange;
  String? hinttext;
  bool obscuretext;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      style:const TextStyle(color: Colors.white),
      obscureText: obscuretext,
      validator: (data){
        if(data!.isEmpty){
          return'feild is requied';
        }
        return null;
      },
          onChanged: onChange,
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: const TextStyle(color: Colors.white),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white) ),


              border: const OutlineInputBorder(borderSide:  BorderSide(color: Colors.white),),

              ),
            );
  }
}