
import 'package:chat_app/Screens/models/messagemodel.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/chatbuble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String  id='ChatPage';
  final ScrollController ccontroller = ScrollController();

    CollectionReference massage = FirebaseFirestore.instance.collection(Kmessagecollection);
    TextEditingController controller = TextEditingController();
   ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
        String  email=ModalRoute.of(context)!.settings.arguments.toString();

    return   StreamBuilder<QuerySnapshot>(
      stream: massage.orderBy('createdAt',descending: true).snapshots(),
      builder: (context,snapshot){

        if(snapshot.hasData){
            List<Massage>massagelist=[];
            for(int i=0;i<snapshot.data!.docs.length;i++){
              massagelist.add(Massage.fromJson(snapshot.data!.docs[i]));
            }
        return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
             Image.asset(logophoto,height: 50,),
              const Text(" Chat"),

          ], ),),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: ccontroller,
                  itemCount:massagelist.length,
                  itemBuilder: (context,index){
                  return massagelist[index].id==email?Customchatbuble(massage: massagelist[index],)
                  :Customchatbublefriend(massage: massagelist[index]);
                }),
              ),
               Padding(
                padding:   const  EdgeInsets.only(   left : 10.0,
                                           top :8.0,
                                      right : 8.0,
                                    bottom : 7.0,),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data){
                    massage.add({
                      'massage':data,
                      'createdAt':DateTime.now(),
                      'id':email,
                    });
                    controller.clear();
                    ccontroller.animateTo(
                   0,
                    duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
  );
                  },
                  decoration: InputDecoration(
                    hintText: 'Send Massage',
                    suffixIcon: const Icon(Icons.send),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
    );
    }else{
      return const Text("Loading...");
    }
      },
    );
  }
}
