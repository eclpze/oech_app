import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oech_app/globals.dart';
import 'package:oech_app/home.dart';

// Экран с транзакциями
class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              TransactionSuccessful(),
          transitionDuration: Duration.zero,
        ),
      ),
    );
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 130),
                child: Image.asset('assets/images/loading.png', width: 120),
              ),
              Text(
                'Your rider is on the way to your destination',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 140, top: 5),
                child: RichText(
                  text: TextSpan(
                    text: 'Tracking Number ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'R-7458-4567-4434-5854',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: Color(0xff0560FA)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 340,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => MainPage(initialPage: 2,)));
                    clearControllers();
                  },
                  child: Text('Track my item'),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 340,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => MainPage(initialPage: 0,)));
                    clearControllers();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xff0560FA)),
                  ),
                  child: Text(
                    'Go back to homepage',
                    style: TextStyle(color: Color(0xff0560FA)),
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

class TransactionSuccessful extends StatelessWidget {
  const TransactionSuccessful({super.key});

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
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 130),
                child: Image.asset('assets/images/successful.png', width: 120),
              ),
              Text(
                'Transaction Successful',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              Text(
                'Your rider is on the way to your destination',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 140, top: 5),
                child: RichText(
                  text: TextSpan(
                    text: 'Tracking Number ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'R-7458-4567-4434-5854',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: Color(0xff0560FA)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 340,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => MainPage(initialPage: 2,)));
                    clearControllers();
                  },
                  child: Text('Track my item'),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: 340,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => MainPage(initialPage: 0)));
                    clearControllers();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xff0560FA)),
                  ),
                  child: Text(
                    'Go back to homepage',
                    style: TextStyle(color: Color(0xff0560FA)),
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
