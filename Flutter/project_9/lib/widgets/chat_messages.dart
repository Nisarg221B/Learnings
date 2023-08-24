import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project9/widgets/Message_card.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});
  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt', // order the stream by timestamp
            descending: true, // with the latest message at top
            // but as the list builder is reveresed , it will be displayed at the
            // bottom
          )
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages yet..'),
          );
        }
        if (chatSnapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        final loadedMessages = chatSnapshot.data!.docs;

        return ListView.builder(
          padding: const EdgeInsets.only(
            bottom: 40,
            left: 10,
            right: 10,
          ),
          reverse: true, // setting reverse true will build the list from bottom
          // and overall list will be pushed down to bottom
          itemCount: loadedMessages.length,
          itemBuilder: (ctx, index) {
            final chatMessages = loadedMessages[index].data();
            final nextChatMessage = index + 1 < loadedMessages.length
                ? loadedMessages[index + 1].data()
                : null;
            final currMessageUserID = chatMessages['userID'];
            final nextMessageUserID =
                nextChatMessage != null ? nextChatMessage['userID'] : null;
            final nextUserIsSame = nextMessageUserID == currMessageUserID;
            if (nextUserIsSame) {
              return MessageBubble.next(
                  message: chatMessages['text'],
                  isMe: authenticatedUser.uid == currMessageUserID);
            } else {
              return MessageBubble.first(
                userImage: chatMessages['userImage'],
                username: chatMessages['username'],
                message: chatMessages['text'],
                isMe: authenticatedUser.uid == currMessageUserID,
              );
            }
          },
        );
      },
    );
  }
}
