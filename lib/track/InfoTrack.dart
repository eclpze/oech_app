import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oech_app/globals.dart';
import 'package:oech_app/track/DeliveryInfo.dart';

// Экран с информацией о посылке
class InfoTrack extends StatelessWidget {
  const InfoTrack({
    super.key,
    required this.originInfo,
    required this.destinationInfo,
    required this.packageInfo,
  });

  final List<String> originInfo;
  final List<String> destinationInfo;
  final List<String> packageInfo;

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
                        style: GoogleFonts.roboto(
                          color: Color(0xffA7A7A7),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                      style: GoogleFonts.roboto(
                        color: Color(0xff0560FA),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Origin details',
                      style: GoogleFonts.roboto(
                        color: Color(0xff3A3A3A),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                            style: GoogleFonts.roboto(
                              color: Color(0xffA7A7A7),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Destination details',
                      style: GoogleFonts.roboto(
                        color: Color(0xff3A3A3A),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: destinationInfo.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            destinationInfo[index],
                            style: GoogleFonts.roboto(
                              color: Color(0xffA7A7A7),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Other details',
                      style: GoogleFonts.roboto(
                        color: Color(0xff3A3A3A),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                                style: GoogleFonts.roboto(
                                  color: Color(0xffA7A7A7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                packageInfo[index],
                                style: GoogleFonts.roboto(
                                  color: Color(0xffEC8000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
                      style: GoogleFonts.roboto(
                        color: Color(0xff0560FA),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: charges.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Text(
                                chargesLabel[index],
                                style: GoogleFonts.roboto(
                                  color: Color(0xffA7A7A7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                charges[index],
                                style: GoogleFonts.roboto(
                                  color: Color(0xffEC8000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
                          style: GoogleFonts.roboto(
                            color: Color(0xffA7A7A7),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'N3000.00',
                          style: GoogleFonts.roboto(
                            color: Color(0xffEC8000),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Click on  delivered for successful delivery and rate rider or report missing item',
                  style: GoogleFonts.roboto(
                    color: Color(0xff0560FA),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    SizedBox(
                      width: 160,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Color(0xff0560FA)),
                        ),
                        child: Text(
                          'Report',
                          style: TextStyle(color: Color(0xff0560FA)),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    SizedBox(
                      width: 160,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Delivery(),
                            ),
                          );
                        },
                        child: Text('Successful'),
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
