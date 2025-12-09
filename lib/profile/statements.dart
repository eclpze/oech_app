import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oech_app/globals.dart';
import 'package:oech_app/profile/transaction.dart';

// Экраны с информацией о заказе
class Statements extends StatefulWidget {
  const Statements({super.key});

  @override
  State<Statements> createState() => _StatementsState();
}

class _StatementsState extends State<Statements> {
  bool _hasText = false;
  bool isInstant = false;
  bool isScheduled = false;

  @override
  void initState() {
    super.initState();
    originAddressController.addListener(updateButton);
    originCountryController.addListener(updateButton);
    originPhoneController.addListener(updateButton);
    destinationAddressController.addListener(updateButton);
    destinationCountryController.addListener(updateButton);
    destinationPhoneController.addListener(updateButton);
    packageItemsController.addListener(updateButton);
    packageWeightController.addListener(updateButton);
    packageWorthController.addListener(updateButton);
  }

  void updateButton() {
    setState(() {
      _hasText =
          originAddressController.text.isNotEmpty &&
          originCountryController.text.isNotEmpty &&
          originPhoneController.text.isNotEmpty &&
          destinationAddressController.text.isNotEmpty &&
          destinationCountryController.text.isNotEmpty &&
          destinationPhoneController.text.isNotEmpty &&
          packageWorthController.text.isNotEmpty &&
          packageWeightController.text.isNotEmpty &&
          packageItemsController.text.isNotEmpty &&
          (isInstant || isScheduled);
    });
  }

  void clearControllers() {
    originOthersController.clear();
    originPhoneController.clear();
    originCountryController.clear();
    originAddressController.clear();
    destinationAddressController.clear();
    destinationCountryController.clear();
    destinationOthersController.clear();
    destinationPhoneController.clear();
    packageWorthController.clear();
    packageWeightController.clear();
    packageItemsController.clear();
    setState(() {
      _hasText = false;
    });
  }

  void toggleDelivery(bool instantSelected) {
    setState(() {
      isInstant = instantSelected;
      isScheduled = !instantSelected;
      updateButton();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                        child: SvgPicture.asset(
                          'assets/icons/arrow-square.svg',
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Send a package',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 34, 21, 5),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/origin-details.png',
                          width: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Origin Details',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: Color(0xff3A3A3A)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 235,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(21, 0, 21, 5),
                          child: TextField(
                            controller: originDetails[index],
                            cursorColor: Colors.black,
                            cursorHeight: 20,
                            decoration: InputDecoration(
                              labelText: originLabel[index],
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffE6E6E6),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffE6E6E6),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: originDetails.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 34, 21, 5),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/destination-details.png',
                          width: 10,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Destination Details',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: Color(0xff3A3A3A)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 235,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(21, 0, 21, 5),
                          child: TextField(
                            controller: destinationDetails[index],
                            cursorColor: Colors.black,
                            cursorHeight: 20,
                            decoration: InputDecoration(
                              labelText: destinationLabel[index],
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffE6E6E6),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffE6E6E6),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: destinationDetails.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 10, 21, 13),
                    child: Row(
                      children: [
                        Image.asset('assets/images/add-square.png', width: 16),
                        SizedBox(width: 6),
                        Text(
                          'Add destination',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: Color(0xff3A3A3A)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 34, 21, 5),
                    child: Row(
                      children: [
                        Text(
                          'Package Details',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: Color(0xff3A3A3A)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(21, 0, 21, 5),
                          child: TextField(
                            controller: packageDetails[index],
                            cursorColor: Colors.black,
                            cursorHeight: 20,
                            decoration: InputDecoration(
                              labelText: packageLabel[index],
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffE6E6E6),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffE6E6E6),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: packageDetails.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 10, 21, 5),
                    child: Row(
                      children: [
                        Text(
                          'Select delivery type',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: Color(0xff3A3A3A)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            toggleDelivery(true);
                          },
                          child: Container(
                            width: 160,
                            height: 75,
                            padding: EdgeInsets.all(8.5),
                            decoration: BoxDecoration(
                              color: isInstant
                                  ? Color(0xff0560FA)
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/clock.png',
                                  width: 24,
                                  color: isInstant
                                      ? Colors.white
                                      : Color(0xffA7A7A7),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Instant delivery',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: isInstant
                                            ? Colors.white
                                            : Color(0xffA7A7A7),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 24),
                        GestureDetector(
                          onTap: () {
                            toggleDelivery(false);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.5),
                            width: 160,
                            height: 75,
                            decoration: BoxDecoration(
                              color: isScheduled
                                  ? Color(0xff0560FA)
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/calender.png',
                                  width: 24,
                                  color: isScheduled
                                      ? Colors.white
                                      : Color(0xffA7A7A7),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Scheduled delivery',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: isScheduled
                                            ? Colors.white
                                            : Color(0xffA7A7A7),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 23, bottom: 20),
                    child: SizedBox(
                      width: 342,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_hasText && (isInstant || isScheduled)) {
                            List<String> originInfo = [
                              originAddressController.text,
                              originPhoneController.text,
                            ];

                            List<String> destinationInfo = [
                              destinationAddressController.text,
                              destinationPhoneController.text,
                            ];

                            List<String> packageInfo = [
                              packageItemsController.text,
                              packageWeightController.text,
                              packageWorthController.text,
                              trackingNumber,
                            ];


                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => StatementsInformation(
                                  originInfo: originInfo,
                                  destinationInfo: destinationInfo,
                                  packageInfo: packageInfo,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              (_hasText && (isInstant || isScheduled))
                              ? Color(0xff0560FA)
                              : Color(0xffA7A7A7),
                        ),
                        child: Text('Next'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatementsInformation extends StatelessWidget {
  const StatementsInformation({
    super.key,
    required this.originInfo,
    required this.destinationInfo,
    required this.packageInfo,
  });

  final List<String> originInfo;
  final List<String> destinationInfo;
  final List<String> packageInfo;

  void clearControllers() {
    originOthersController.clear();
    originPhoneController.clear();
    originCountryController.clear();
    originAddressController.clear();
    destinationAddressController.clear();
    destinationCountryController.clear();
    destinationOthersController.clear();
    destinationPhoneController.clear();
    packageWorthController.clear();
    packageWeightController.clear();
    packageItemsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                        child: SvgPicture.asset(
                          'assets/icons/arrow-square.svg',
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Send a package',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package Information',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Color(0xff0560FA),
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Text(
                        'Origin details',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: Color(0xff3A3A3A)),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: originInfo.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            originInfo[index],
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  height: 1.4,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA7A7A7),
                                ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Text(
                        'Destination details',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: Color(0xff3A3A3A)),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: destinationInfo.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            destinationInfo[index],
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  height: 1.3,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffA7A7A7),
                                ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 4),
                      child: Text(
                        'Other details',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: Color(0xff3A3A3A)),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: packageLabel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Text(
                                packageLabel[index],
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      height: 1.3,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffA7A7A7),
                                    ),
                              ),
                              Spacer(),
                              Text(
                                packageInfo[index],
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Color(0xffEC8000),
                                      height: 1.3,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 5),
                      child: Divider(color: Color(0xffA7A7A7), height: 2),
                    ),
                    Text(
                      'Charges',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Color(0xff0560FA),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: charges.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Text(
                                chargesLabel[index],
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      height: 1.3,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffA7A7A7),
                                    ),
                              ),
                              Spacer(),
                              Text(
                                charges[index],
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      color: Color(0xffEC8000),
                                      height: 1.3,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Divider(color: Color(0xffA7A7A7), height: 2),
                    ),
                    Row(
                      children: [
                        Text(
                          'Package total',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffA7A7A7),
                              ),
                        ),
                        Spacer(),
                        Text(
                          'N3000.00',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Color(0xffEC8000),
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 70),
                child: Row(
                  children: [
                    SizedBox(
                      width: 160,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Statements(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Color(0xff0560FA)),
                        ),
                        child: Text(
                          'Edit package',
                          style: TextStyle(color: Color(0xff0560FA)),
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 160,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Transaction(),
                            ),
                          );
                        },
                        child: Text('Make payment'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
