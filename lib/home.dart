import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oech_app/authentication/reg.dart';
import 'package:oech_app/globals.dart';
import 'package:oech_app/home/chats.dart';
import 'package:oech_app/home/customerCare.dart';
import 'package:oech_app/home/sendPackage.dart';
import 'package:oech_app/home/yourWallet.dart';
import 'package:oech_app/profile/aboutUs.dart';
import 'package:oech_app/profile/editProfile.dart';
import 'package:oech_app/profile/referrals.dart';
import 'package:oech_app/profile/statements.dart';
import 'package:oech_app/profile/notifySettings.dart';
import 'package:oech_app/theme.dart';
import 'package:oech_app/track/InfoTrack.dart';
import 'package:oech_app/wallet/CardWidget.dart';
import 'package:provider/provider.dart';

// Основной экран приложения с навигацией
class MainPage extends StatefulWidget {
  final int initialPage;

  const MainPage({super.key, required this.initialPage});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _currentPage;
  bool isClick = false;

  final List<Widget> _pages = [Home(), Wallet(), Track(), Profile()];

  // Виджет с иконками для навигации
  Widget _navIcon(String assetPath, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          color: isSelected ? Color(0xff0560FA) : Colors.transparent,
          indent: 30,
          endIndent: 30,
          thickness: 3,
        ),
        SizedBox(height: 4),
        SvgPicture.asset(
          assetPath,
          color: isSelected ? Color(0xff0560FA) : Color(0xffA7A7A7),
          width: 24,
          height: 24,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        mouseCursor: SystemMouseCursors.click,
        items: [
          BottomNavigationBarItem(
            icon: _navIcon('assets/icons/house.svg', _currentPage == 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _navIcon('assets/icons/wallet.svg', _currentPage == 1),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: _navIcon('assets/icons/track.svg', _currentPage == 2),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: _navIcon('assets/icons/profile.svg', _currentPage == 3),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff0560FA),
        unselectedItemColor: Color(0xffA7A7A7),
        selectedLabelStyle: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// Главный экран
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
  ];

  List<String> sectionName = [
    'Customer Care',
    'Send a package',
    'Fund your wallet',
    'Chats',
  ];
  List<String> sectionIcon = [
    'assets/icons/call-centre.svg',
    'assets/icons/package.svg',
    'assets/icons/your-wallet.svg',
    'assets/icons/chats.svg',
  ];
  List<String> sectionDescription = [
    'Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today',
    'Request for a driver to pick up or deliver your package for you',
    'To fund your wallet is as easy as ABC, make use of our fast technology and top-up your wallet today',
    'Search for available rider within your area',
  ];

  final List<Widget> _pages = [
    CustomerCare(),
    SendPackage(),
    YourWallet(),
    Chats(),
  ];

  int _selectedIndex = -1;

  void _navigateToPage(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => _pages[index]));
    // Future.delayed(Duration(milliseconds: 10), () {
    //   Navigator.of(
    //     context,
    //   ).push(MaterialPageRoute(builder: (context) => _pages[index])).then((_) {
    //     setState(() {
    //       _selectedIndex = -1;
    //     });
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Container(
                  height: 35,
                  width: 341,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Search services',
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
              Container(
                height: 91,
                width: 341,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xff0560FA),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/avatar.png', width: 60),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            'Hello Ken!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'We trust you are having a great time',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Color(0xffCFCFCF),
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/icon-notification.svg',
                      color: Colors.white,
                      width: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 39, 12, 19),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Special for you',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Color(0xffEC8000),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          'assets/icons/arrow-square-right.svg',
                          color: Color(0xffEC8000),
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 65,
                      child: ListView.builder(
                        itemCount: images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Image.asset(images[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      'What would you like to do',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: Color(0xff0560FA),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: sectionName.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool selectedIndex = _selectedIndex == index;

                    return GestureDetector(
                     onLongPress: () {
                        _navigateToPage(context, index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(18),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selectedIndex
                              ? Color(0xff0560FA)
                              : Theme.of(context).cardColor,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color(0xffA7A7A7),
                          //     blurRadius: 1.0,
                          //     offset: Offset(0, 1),
                          //   ),
                          // ],
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            SvgPicture.asset(
                              sectionIcon[index],
                              width: 40,
                              height: 33,
                              color: selectedIndex
                                  ? Colors.white
                                  : Color(0xff0560FA),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                sectionName[index],
                                style: Theme.of(context).textTheme.labelMedium
                                    ?.copyWith(
                                      color: selectedIndex
                                          ? Colors.white
                                          : Color(0xff0560FA),
                                    ),
                              ),
                            ),
                            Text(
                              sectionDescription[index],
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(
                                    color: selectedIndex
                                        ? Colors.white
                                        : Color(0xffA7A7A7),
                                    fontSize: 8,
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
      ),
    );
  }
}

// Экран Кошелек
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool _isShow = false;
  List<String> transactionSum = [
    '-N3,000.00',
    'N2,000.00',
    '-N3,000.00',
    'N1,000.00',
    'N2,500.00',
    '-N3,000.00',
    'N2,500.00',
    'N1,000.00',
    '-N3,000.00',
  ];
  List<int> transactionSumColor = [
    0xffED3A3A,
    0xff35B369,
    0xffED3A3A,
    0xff35B369,
    0xff35B369,
    0xffED3A3A,
    0xff35B369,
    0xff35B369,
    0xffED3A3A,
  ];
  List<String> transactionTitle = [
    'Delivery fee',
    'Lalalalala',
    'Third Delivery',
    'Another One',
    'Experts Are The Best',
    'Delivery fee',
    'Delivery',
    'Delivery fee',
    'Third Delivery',
  ];
  List<String> transactionDate = [
    'July 7, 2022',
    'July 4, 2022',
    'July 1, 2022',
    'June 27, 2022',
    'June 23, 2022',
    'June 17, 2022',
    'June 14, 2022',
    'June 9, 2022',
    'June 1, 2022',
  ];
  List<String> section = [
    'assets/images/bank.png',
    'assets/images/transfer.png',
    'assets/images/card.png',
  ];
  List<String> sectionTitle = ['Bank', 'Transfer', 'Card'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Wallet',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    child: Image.asset('assets/images/avatar.png'),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Ken',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Current balance: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: _isShow ? 'N10,712:00' : '******',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0560FA),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _isShow = !_isShow;
                    });
                  },
                  icon: SvgPicture.asset(
                    _isShow
                        ? 'assets/icons/eye.svg'
                        : 'assets/icons/eye-slash.svg',
                    width: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 140,
            width: 340,
            padding: EdgeInsetsGeometry.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Text('Top Up', style: Theme.of(context).textTheme.labelLarge),
                SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 2) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CardWidget(),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 30),
                          child: Column(
                            children: [
                              Image.asset(section[index], width: 49),
                              SizedBox(height: 5),
                              Text(
                                sectionTitle[index],
                                style: Theme.of(
                                  context,
                                ).textTheme.labelMedium?.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: section.length,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Text(
                  'Transaction History',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.fromLTRB(12, 13, 12, 13),
                  margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffA7A7A7),
                        blurRadius: 1.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactionSum[index],
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Color(transactionSumColor[index]),
                                ),
                          ),
                          Text(
                            transactionTitle[index],
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        transactionDate[index],
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactionTitle.length,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

// Экран со статусами заказа
class Track extends StatefulWidget {
  const Track({super.key});

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> {
  List<String> packageStatus = [
    'Courier requested',
    'Package ready for delivery',
    'Package in transit',
  ];

  List<String> dateStatus = [
    'July 7 2022 08:00am',
    'July 7 2022 08:30am',
    'July 7 2022 10:00am',
  ];

  List<bool> valueStatus = [true, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/map.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 30, 24, 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tracking Number',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/status-track.svg',
                            width: 15,
                          ),
                          SizedBox(width: 3),
                          Text(
                            ' R-7458-4567-4434-5854',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Color(0xff0560FA),
                                  fontSize: 18,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Package Status',
                        style: GoogleFonts.roboto(
                          color: Color(0xffA7A7A7),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    activeColor: Color(0xff0560FA),
                    side: BorderSide(color: Color(0xff006CEC)),
                    value: valueStatus[index],
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          valueStatus[index] = value;
                        });
                      }
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Transform.translate(
                      offset: Offset(-8, 0),
                      child: Text(
                        packageStatus[index],
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    subtitle: Transform.translate(
                      offset: Offset(-8, 0),
                      child: Text(
                        dateStatus[index],
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Color(0xffEC8000),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: packageStatus.length,
              ),
            ),
            CheckboxListTile(
              dense: true,
              enabled: false,
              value: true,
              onChanged: null,
              visualDensity: VisualDensity.compact,
              controlAffinity: ListTileControlAffinity.leading,
              title: Transform.translate(
                offset: Offset(-8, 0),
                child: Text(
                  'Package delivered',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: Transform.translate(
                offset: Offset(-8, 0),
                child: Text(
                  'July 7 2022 10:30am',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Color(0xffEC8000)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: 340,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    List<String> originInfo = ['Russia, HMAO', '+79525519627'];

                    List<String> destinationInfo = [
                      'SPK, Pushkina 10',
                      '+79525519627',
                    ];

                    List<String> packageInfo = [
                      'Laptop',
                      '2.5kg',
                      '1',
                      trackingNumber,
                    ];
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => InfoTrack(
                          originInfo: originInfo,
                          destinationInfo: destinationInfo,
                          packageInfo: packageInfo,
                        ),
                      ),
                    );
                  },
                  child: Text('View Package Info'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Экран Профиль
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isShow = false;

  List<String> iconSection = [
    'assets/icons/icon-profile.svg',
    'assets/icons/icon-certificate.svg',
    'assets/icons/icon-notification.svg',
    'assets/icons/icon-wallet.svg',
    'assets/icons/icon-carbon.svg',
    'assets/icons/icon-map.svg',
    'assets/icons/icon-log-out.svg',
  ];
  List<String> titleSection = [
    'Edit Profile',
    'Statements & Reports',
    'Notification Settings',
    'Card & Bank account settings',
    'Referrals',
    'About Us',
    'Log Out',
  ];
  List<String> descriptionSection = [
    'Name, phone no, address, email ...',
    'Download transaction details, orders, deliveries',
    'Mute, unmute, set location & tracking setting',
    'Change cards, delete card details',
    'Check no of friends and earn',
    'Know more about us, terms and conditions',
    '',
  ];

  final List<Widget> _pages = [
    EditProfile(),
    Statements(),
    NotifySettings(),
    CardWidget(),
    Referrals(),
    AboutUs(),
    SizedBox(),
  ];

  void _navigateToPage(BuildContext context, int index) {
    if (index == 6) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => LogIn()));
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => _pages[index]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffA7A7A7),
                  blurRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 27),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircleAvatar(
                    child: Image.asset('assets/images/avatar.png'),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Ken',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Current balance: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: _isShow ? 'N10,712:00' : '******',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0560FA),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      _isShow = !_isShow;
                    });
                  },
                  icon: SvgPicture.asset(
                    _isShow
                        ? 'assets/icons/eye.svg'
                        : 'assets/icons/eye-slash.svg',
                    width: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Enable dark Mode',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Spacer(),
                FlutterSwitch(
                  width: 60.0,
                  height: 35.0,
                  toggleSize: 30.0,
                  value: Provider.of<ThemeChange>(context, listen: true).isDark,
                  borderRadius: 25.0,
                  padding: 4.0,
                  onToggle: (val) {
                    Provider.of<ThemeChange>(
                      context,
                      listen: false,
                    ).toggleTheme();
                  },
                  activeColor: Color(0xff0560FA),
                  inactiveColor: Color(0xffC6C6C6),
                  toggleColor: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToPage(context, index);
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12, 13, 12, 13),
                    margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffA7A7A7),
                          blurRadius: 1.0,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          iconSection[index],
                          width: 25,
                          height: 25,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titleSection[index],
                              style: Theme.of(
                                context,
                              ).textTheme.labelLarge?.copyWith(fontSize: 16),
                            ),
                            if (index != 6)
                              Text(
                                descriptionSection[index],
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(color: Color(0xffA7A7A7)),
                              ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset('assets/icons/icon-arrow.svg'),
                      ],
                    ),
                  ),
                );
              },
              itemCount: titleSection.length,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
