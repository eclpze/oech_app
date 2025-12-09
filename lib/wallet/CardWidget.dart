import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oech_app/home.dart';

// Экран с информацией о сохраненных картах
class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  String? _selectMethod;
  String? _selectCard;

  final List<Map<String, String>> _cards = [
    {'id': '1', 'lastFours': '3323'},
    {'id': '2', 'lastFours': '1547'},
  ];

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
                      child: SvgPicture.asset('assets/icons/arrow-square.svg'),
                    ),
                    Spacer(),
                    Text(
                      'Add Payment method',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            // Кошелек
            Container(
              margin: EdgeInsets.fromLTRB(24, 65, 24, 15),
              width: double.infinity,
              height: 85,
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
              child: Row(
                children: [
                  Radio(
                    value: 'wallet',
                    groupValue: _selectMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectMethod = value;
                        _selectCard = null;
                      });
                    },
                    activeColor: Color(0xff0560FA),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pay with wallet',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: Color(0xff3A3A3A)),
                      ),
                      Text(
                        'complete the payment using your e wallet',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Карта
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
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
              child: _selectMethod == 'card'
                  ? Column(
                      children: [
                        SizedBox(
                          height: 80,
                          child: Row(
                            children: [
                              Radio(
                                value: 'card',
                                groupValue: _selectMethod,
                                onChanged: (value) {
                                  setState(() {
                                    _selectMethod = value;
                                    _selectCard = null;
                                  });
                                },
                                activeColor: Color(0xff0560FA),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Credit / debit card',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(color: Color(0xff3A3A3A)),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'complete the payment using your debit card',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 165,
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              final card = _cards[index];
                              final _isSelected = _selectCard == card['id'];

                              return Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
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
                                    Radio(
                                      value: card['id'],
                                      groupValue: _selectCard,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectCard = value;
                                        });
                                      },
                                      activeColor: Color(0xff0560FA),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '**** **** ${card['lastFours']}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(color: Color(0xff3A3A3A)),
                                    ),
                                    Spacer(),
                                    SvgPicture.asset('assets/icons/trash.svg'),
                                    SizedBox(width: 12),
                                  ],
                                ),
                              );
                            },
                            itemCount: _cards.length,
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          Radio(
                            value: 'card',
                            groupValue: _selectMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectMethod = value;
                                _selectCard = null;
                              });
                            },
                            activeColor: Color(0xff0560FA),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Credit / debit card',
                                  style: Theme.of(context).textTheme.labelMedium
                                      ?.copyWith(color: Color(0xff3A3A3A)),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'complete the payment using your debit card',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _selectMethod == 'card' ? 175 : 340,
              ),
              child: SizedBox(
                width: 342,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainPage(initialPage: 0,)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0560FA),
                  ),
                  child: Text('Proceed to pay'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
