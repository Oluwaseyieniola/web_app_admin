import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waya_pay/core/utils/color_constants.dart';
import 'package:waya_pay/features/auth/providers/user_provider.dart';
import 'package:waya_pay/features/chat/models/chat_model.dart';
import 'package:waya_pay/features/chat/screens/chat_screen.dart';
import 'package:waya_pay/features/chat/services/chat_services.dart';
import 'package:waya_pay/features/chat/widgets/chat_container.dart';
import 'package:waya_pay/widgets/circular_loader.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final ChatServices chatServices = ChatServices();
  List<ChatModel>? chatList;
  late Future future;

  getChats() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;

    userProvider.type == "admin"
        ? chatList = await chatServices.getAllChats(context: context)
        : chatList = await chatServices.getAgentChat(
            context: context,
            username: userProvider.username,
          );
  }

  void createChat({
    required String sender,
    required String receiver,
    required String chatName,
  }) {
    chatServices.createChat(
      context: context,
      sender: sender,
      receiver: receiver,
      chatName: chatName,
    );
  }

  @override
  void initState() {
    super.initState();
    future = getChats();
    print(chatList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return chatList == null
                ? const Center(
                    child: Text(
                    "No Chats Found",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ))
                : Column(
                    children: [
                      const Text(
                        "User Chat",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Provide Support to Users of the Pay Mobile App",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: chatList!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final chatData = chatList![index];
                            return GestureDetector(
                              onTap: () {
                                createChat(
                                  sender: chatData.sender,
                                  receiver: chatData.receiver,
                                  chatName: chatData.chatName,
                                );
                                Navigator.pushNamed(context, ChatScreen.route,
                                    arguments: chatList![index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: ChatContainer(
                                  username: chatData.sender,
                                  latestMessage: chatData.latestMessage,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          } else {}
          return const CircularLoader();
        },
      ),
    );
  }
}
