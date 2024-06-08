import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/app/pages/navigation/utilities/get_users.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FireStoreService firestoreService = FireStoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getUsersStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List usersList = snapshot.data!.docs;
              return ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = usersList[index];
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  String userProvider = data['provider'];
                  String userEmail = data['email'];
                  var userPic = data['profilepic'];
                  return ListTile(
                    leading: SizedBox(
                      height: 100,
                      width: 50,
                      child: userPic != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image(
                                image: NetworkImage(
                                  userPic,
                                  scale: 0.5,
                                ),
                                fit: BoxFit.fill,
                              ))
                          : Icon(FontAwesomeIcons.circleUser),
                    ),
                    title: Text(userEmail),
                    subtitle: Text(
                        data['name'] != null ? data['name'] : data['username']),
                    trailing: Text(userProvider),
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'No notifications yet \n🙃🔕❤️‍🩹',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
