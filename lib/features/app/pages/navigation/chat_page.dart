import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorexpert/features/repos/fetch_data/get_users.dart';
import 'package:explorexpert/global/utilities/current_user_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../user_auth/presentation/widgets/essentials.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              FutureBuilder<DocumentSnapshot>(
                  future: firestoreService
                      .getCurrentUserStream(EXCurrentUser.email),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child:
                              const Center(child: CircularProgressIndicator()));
                    }
                    var currentUser =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 120,
                              width: 120,
                              child: Container(
                                width: 100 * 2 + 5 * 2,
                                height: 100 * 2 + 5 * 2,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: EXColors
                                      .primaryDark, // The color of the ring
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: (currentUser['profilepic'] == null)
                                        ? const Icon(
                                            FontAwesomeIcons.solidCircleUser,
                                            size: 100,
                                          )
                                        : Image(
                                            image: NetworkImage(
                                                currentUser['profilepic']),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: EXColors.primaryLight,
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.edit,
                                        size: 20.0,
                                        color: EXColors.primaryDark)),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          currentUser['name'].toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          currentUser['email'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    );
                  }),
              const Divider(
                height: 10,
                thickness: 5,
                color: Colors.green,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getUsersStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List usersList = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
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
                                : const Icon(FontAwesomeIcons.circleUser),
                          ),
                          title: Text(userEmail),
                          subtitle:
                              Text(data['name'] ?? data['username'].toString()),
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
            ],
          ),
        ),
      ),
    );
  }
}
