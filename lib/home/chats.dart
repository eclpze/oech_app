import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Экранов чатов
class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  final Random _random = Random();

  List<String> avatarUsers = [
    'assets/images/avatar.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
  ];

  List<String> nameUsers = [
    'John Joshua',
    'Chinonso James',
    'Raph Ron',
    'Joy Ezekiel',
    'Emma Johnson',
  ];

  List<String> phoneUsers = [
    '+234 600 2541 5266',
    '+234 603 6543 7265',
    '+234 602 6442 4161',
    '+234 606 4145 7264',
    '+234 601 1543 6265',
  ];

  List<String> lastMessageUsers = [
    'Thanks for your service',
    'Alright, I wll be waiting',
    'Thanks for your service',
    'Thanks for your service',
    'Thanks for your service',
  ];

  List<bool> countUsers = [true, false, true, false, true];

  void _navigateToPage(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ExampleChat(
          userName: nameUsers[index],
          userAvatar: avatarUsers[index],
          lastMessage: lastMessageUsers[index],
          phoneUser: phoneUsers[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffA7A7A7),
                    blurRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('assets/icons/arrow-square.svg'),
                    ),
                    Spacer(),
                    Text(
                      'Chats',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21, bottom: 21),
              child: Container(
                height: 40,
                width: 365,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Theme.of(context).cardColor,
                ),
                child: Row(
                  children: [
                    Text(
                      'Search for a driver',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Color(0xffA7A7A7),
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/search.svg'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: avatarUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToPage(context, index);
                    },
                    child: Container(
                      height: 84,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(color: Color(0xffA7A7A7)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Image.asset(
                              avatarUsers[index],
                              width: 60,
                              height: 60,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 21),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nameUsers[index],
                                  style: Theme.of(context).textTheme.labelMedium
                                      ?.copyWith(color: Color(0xff3A3A3A)),
                                ),
                                Text(
                                  lastMessageUsers[index],
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          if (countUsers[index] == true)
                            Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff0560FA),
                              ),
                              child: Center(
                                child: Text(
                                  '${_random.nextInt(9) + 1}',
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Экран примерной переписки
class ExampleChat extends StatefulWidget {
  const ExampleChat({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.lastMessage,
    required this.phoneUser,
  });

  final String userName;
  final String userAvatar;
  final String lastMessage;
  final String phoneUser;

  @override
  State<ExampleChat> createState() => _ExampleChatState();
}

class _ExampleChatState extends State<ExampleChat> {
  Widget _buildMyMessage(
    double widthMessage,
    double heightMessage,
    String textMessage,
  ) {
    return Row(
      children: [
        Spacer(),
        Container(
          width: widthMessage,
          height: heightMessage,
          margin: EdgeInsets.symmetric(vertical: 6),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xff0560FA),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            textMessage,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(
    double widthMessage,
    double heightMessage,
    String textMessage,
  ) {
    return Row(
      children: [
        Container(
          width: widthMessage,
          height: heightMessage,
          margin: EdgeInsets.symmetric(vertical: 6),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffCFCFCF),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            textMessage,
            textAlign: TextAlign.start,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffA7A7A7),
                    blurRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('assets/icons/arrow-square.svg'),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Image.asset(widget.userAvatar, width: 50),
                        SizedBox(width: 9),
                        Text(
                          widget.userName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: Color(0xff3A3A3A)),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PhoneDialog(
                              nameUser: widget.userName,
                              avatarUser: widget.userAvatar,
                              phoneUser: widget.phoneUser,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset('assets/icons/phone.svg'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    _buildMyMessage(
                      220,
                      52,
                      'Hello, Please check your phone, I just booked you to deliver my stuff',
                    ),
                    _buildMessage(190, 36, 'Thank you for contacting me.'),
                    _buildMessage(
                      220,
                      52,
                      'I am already on my way to the pick up venue.',
                    ),
                    _buildMyMessage(155, 36, widget.lastMessage),
                  ],
                ),
              ),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/emoji.svg', width: 27),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 267,
                    padding: EdgeInsets.only(left: 32, right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xffCFCFCF),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Enter message',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: Color(0xffA7A7A7),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Spacer(),
                        SvgPicture.asset('assets/icons/dictation.svg'),
                      ],
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/icons/send.svg', width: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Экран телефонного разговора
class PhoneDialog extends StatefulWidget {
  const PhoneDialog({
    super.key,
    required this.nameUser,
    required this.avatarUser,
    required this.phoneUser,
  });

  final String nameUser;
  final String avatarUser;
  final String phoneUser;

  @override
  State<PhoneDialog> createState() => _PhoneDialogState();
}

class _PhoneDialogState extends State<PhoneDialog> {
  final List<String> icons = [
    'assets/icons/plus.svg',
    'assets/icons/pause.svg',
    'assets/icons/video.svg',
    'assets/icons/loud.svg',
    'assets/icons/mute.svg',
    'assets/icons/keypad.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130, bottom: 115),
                child: Column(
                  children: [
                    Image.asset(widget.avatarUser, width: 84),
                    SizedBox(height: 9),
                    Text(
                      widget.nameUser,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Color(0xff0560FA),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: Text(
                        widget.phoneUser,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Color(0xffA7A7A7),
                        ),
                      ),
                    ),
                    Text(
                      'calling...',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xff0560FA),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                  padding: EdgeInsets.symmetric(horizontal: 49, vertical: 40),
                  width: 340,
                  height: 33,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1.2,
                              ),
                          itemCount: icons.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(icons[index], height: 40),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/off-call.svg',
                          width: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
