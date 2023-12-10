
import 'package:chat_app/Screens/models/messagemodel.dart';
import 'package:flutter/material.dart';

class Customchatbuble extends StatelessWidget {
 
   final  Massage massage;

  const Customchatbuble({super.key,required this.massage});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16,top:16,bottom: 16,right: 10),
        
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Color(0xff075e54),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
        topRight: Radius.circular(30)),),
    
       child:  Text(massage.massage,style: const TextStyle(color: Colors.black),),
    
      ),
    );
  }
}

class Customchatbublefriend extends StatelessWidget {
 
   final  Massage massage;

   const Customchatbublefriend({super.key,required this.massage});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16,top:16,bottom: 16,right: 10),
        
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Color(0xffece5dd),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        topRight: Radius.circular(30)),),
    
       child:  Text(massage.massage,style: const TextStyle(color: Colors.black),),
    
      ),
    );
  }
}