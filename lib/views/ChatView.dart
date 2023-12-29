import 'package:flutter/material.dart';
import 'package:scholar_chat_app/constants.dart';
import 'package:scholar_chat_app/models/messageModel.dart';

import '../components/ChatBubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatView extends StatelessWidget {
  ChatView({Key? key}) : super(key: key);
  static String id = 'ChatView';
  TextEditingController messageController = TextEditingController();
  CollectionReference messages = FirebaseFirestore.instance.collection(kMessageCollections);
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder <QuerySnapshot>(
      //to access one document, you need document id in request
      //data returned is DocumentSnapshot not QuerySnapshot
      // future: messages.doc("0iNqCxGyr50XWnWDqpFd").get(),
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot)
        {

          if(snapshot.hasData)
            {
              List<Message> messagesList =[];
              for(int i =0; i<snapshot.data!.docs.length; i++)
                {
                  messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
                }

              //In case of accessing only one document
              // print(snapshot.data!['message']);
              // print(snapshot.data!.docs[0]['message']);
              return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: kPrimaryColor,
                    centerTitle: true,
                    title:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          kLogo,
                          height: 60,
                        ),
                        const Text('Chat', style: TextStyle(color: Colors.white),)
                      ],),),
                  body: Column(children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index)
                          {
                            if(messagesList[index].id == email)
                              {
                                return ChatBubble(message: messagesList[index].message,);
                              }
                            else
                              {
                                return ChatBubbleForFriend(message: messagesList[index].message,);
                              }
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: messageController,
                        onSubmitted: (data)
                        {
                          messages.add({
                            kMessage: data,
                            kCreatedAt: DateTime.now(),
                            'id' : email
                          });

                          messageController.clear();
                          _controller.animateTo(
                              // _controller.position.maxScrollExtent,
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        },
                        decoration: InputDecoration(
                            hintText: 'Send Message',
                            suffixIcon: const Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(color: kPrimaryColor)
                            )
                        ),
                      ),
                    ),
                  ],)
              );
            }
          else
            {
              return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: kPrimaryColor,
                    centerTitle: true,
                    title:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          kLogo,
                          height: 60,
                        ),
                        const Text('Chat', style: TextStyle(color: Colors.white),)
                      ],),),
                  body: const Center(child: Text('Loading....'))
              );

            }

        }
    );
  }
}

//
// return FutureBuilder <QuerySnapshot>(
// //to access one document, you need document id in request
// //data returned is DocumentSnapshot not QuerySnapshot
// // future: messages.doc("0iNqCxGyr50XWnWDqpFd").get(),
// future: messages.get(),
// builder: (context, snapshot)
// {
//
// if(snapshot.hasData)
// {
// List<Message> messagesList =[];
// for(int i =0; i<snapshot.data!.docs.length; i++)
// {
// messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
// }
// print("messages");
// //In case of accessing only one document
// // print(snapshot.data!['message']);
// print(snapshot.data!.docs[0]['message']);
// return Scaffold(
// appBar: AppBar(
// automaticallyImplyLeading: false,
// backgroundColor: kPrimaryColor,
// centerTitle: true,
// title:Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset(
// kLogo,
// height: 60,
// ),
// const Text('Chat', style: TextStyle(color: Colors.white),)
// ],),),
// body: Column(children: [
// Expanded(
// child: ListView.builder(
// itemCount: messagesList.length,
// itemBuilder: (context, index)
// {
// return  ChatBubble(message: messagesList[index].message,);
// }),
// ),
// Padding(
// padding: const EdgeInsets.all(16.0),
// child: TextField(
// controller: messageController,
// onSubmitted: (data)
// {
// messages.add({
// 'message': data,
// });
//
// messageController.clear();
// },
// decoration: InputDecoration(
// hintText: 'Send Message',
// suffixIcon: const Icon(
// Icons.send,
// color: kPrimaryColor,
// ),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(16),
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(16),
// borderSide: const BorderSide(color: kPrimaryColor)
// )
// ),
// ),
// ),
// ],)
// );
// }
// else
// {
// return const Text('Loading....');
// }
//
// }
// );
