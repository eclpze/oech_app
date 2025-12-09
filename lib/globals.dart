import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
// Файл с основными переменными и списками

PageController controller = PageController(); // Контроллер для экрана onboarding

// Контроллеры для текстовых полей
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordConfirmController = TextEditingController();
TextEditingController pinController = TextEditingController();
TextEditingController feedbackController = TextEditingController();

// Информация о расходах
List<String> chargesLabel = [
  'Delivery Charges',
  'Instant delivery',
  'Tax and Service Charges',
];

List<String> charges = [
  'N2,500.00',
  'N300.00',
  'N200.00',
];

// Трек-номер
String trackingNumber = 'R-7458-4567-4434-5854';

// Для Origin Details
TextEditingController originAddressController = TextEditingController();
TextEditingController originCountryController = TextEditingController();
TextEditingController originPhoneController = TextEditingController();
TextEditingController originOthersController = TextEditingController();

List<TextEditingController> originDetails = [
  originAddressController,
  originCountryController,
  originPhoneController,
  originOthersController,
];

List<String> originLabel = [
  'Address',
  'State,Country',
  'Phone number',
  'Others',
];

// Для Destination Details
TextEditingController destinationAddressController = TextEditingController();
TextEditingController destinationCountryController = TextEditingController();
TextEditingController destinationPhoneController = TextEditingController();
TextEditingController destinationOthersController = TextEditingController();

List<TextEditingController> destinationDetails = [
  destinationAddressController,
  destinationCountryController,
  destinationPhoneController,
  destinationOthersController,
];

List<String> destinationLabel = [
  'Address',
  'State,Country',
  'Phone number',
  'Others',
];

// Для Package Details
TextEditingController packageItemsController = TextEditingController();
TextEditingController packageWeightController = TextEditingController();
TextEditingController packageWorthController = TextEditingController();

List<TextEditingController> packageDetails = [
  packageItemsController,
  packageWeightController,
  packageWorthController,
];

List<String> packageLabel = [
  'Package Items',
  'Weight of item(kg)',
  'Worth of Items',
  'Tracking Number',
];

// Стили для оформления ввода пинкода на экране подтверждения почты
final defaultPinTheme = PinTheme(
  width: 32,
  height: 32,
  textStyle: GoogleFonts.roboto(
    color: Color(0xffA7A7A7),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.zero),
    border: Border.all(color: Color(0xffA7A7A7)),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color(0xff0560FA)),
);

final submittedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color(0xff0560FA)),
);

final errorPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color(0xffED3A3A)),
);
