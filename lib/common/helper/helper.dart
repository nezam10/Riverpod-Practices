import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helpers {
  Helpers._();

  static BoxDecoration createButtonDecoration({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      // border: Border.all(
      //   color: Colors.black26,
      // ),
      color: Colors.grey.withOpacity(0.13),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.2),
      //     spreadRadius: 1,
      //     blurRadius: 2,
      //     offset: const Offset(0, 0), // changes position of shadow
      //   ),
      // ]
    );
  }

  static BoxDecoration createDropdownButtonDecoration({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      // border: Border.all(
      //   color: Colors.black26,
      // ),
      color: Colors.white,
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.2),
      //     spreadRadius: 1,
      //     blurRadius: 2,
      //     offset: const Offset(0, 0), // changes position of shadow
      //   ),
      // ]
    );
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  //password Visivility Method
  static IconButton passwordVisivilityMethod(
      void Function()? onPressed, bool isVisible) {
    return IconButton(
      splashColor: Colors.transparent,
      onPressed: onPressed,
      icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
    );
  }

  //Check validate Email method
  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  // show SnackBar Build method
  static void showSnackBarBuild(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<String?> datePickerShow(BuildContext context,
      [String? dateFormate]) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.blue,
                onPrimary: Colors.white,
                onSurface: Colors.blueAccent,
              ),
              textButtonTheme: const TextButtonThemeData(
                  // style: TextButton.styleFrom(
                  //   primary: Colors.w, // button text color
                  // ),
                  ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate =
          DateFormat(dateFormate ?? 'yyyy-MM-dd').format(pickedDate);
      print(formattedDate);

      return formattedDate;
    } else {}
  }

  static monthYear(String dateStart) {
    DateFormat inputFormat = DateFormat('dd/MM/yyyy hh:mm:ss a');
    DateTime input = inputFormat.parse(dateStart);
    String result = DateFormat('MM/yyyy').format(input);
    return result;
  }

  static String cardMaskingStart(String cardnumber) {
    String number = "";

    final String stripped = cardnumber.replaceAll(RegExp(r'[^\d]'), '');
    if (stripped.length > 8) {
      final String middle = cardnumber
          .trim()
          .substring(6, cardnumber.length - 4)
          .replaceAll(RegExp(r'\d'), '*')
          .replaceAll(" ", "");

      number = stripped.substring(0, 6) +
          middle +
          stripped.substring(stripped.length - 4);
    }
    return number.trim();
  }

  // responsibe font size
  static double calculateFontSize(double screenWidth) {
    if (screenWidth > 450) {
      return 14.0;
    } else if (screenWidth > 350) {
      return 13.0;
    } else if (screenWidth > 320) {
      return 12.0;
    } else {
      return 10.0;
    }
  }

  static void customAlertDialog(
      {required BuildContext context,
      required Widget actions,
      required Widget content,
      required String header}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              header,
              textAlign: TextAlign.center,
            ),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            actionsPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 0.0,
            ),
            content: content,
            actions: [actions],
          );
        });
  }
}

//########### outside of class

extension HexColorApp on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension StringToInt on String {
  int parseInt() {
    return int.parse(this);
  }
}

extension FancyNum on num {
  num plus(num other) => this + other;

  num times(num other) => this * other;
}

extension ExtendedString on String {
  bool get isValidName {
    return !contains(RegExp(r'[0–9]'));
  }
}

extension DateTimeFormat on DateTime {
  String get ddMMyy => DateFormat("dd-MM-yy").format(this);
  String ddMMyyyy(String formate) {
    return DateFormat(formate).format(this);
  }

  String get yyyDDmm => DateFormat("yyyy-MM-dd").format(this);
  String get mmYYYY => DateFormat("MM-yyyy").format(this);
  String get mmDDyyHHmmA => DateFormat('MM/dd/yyyy hh:mm a').format(this);
  String get yyyDDmmNumber => DateFormat("yyyyMMdd").format(this);
}

extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Widget TitleTextWidget({BuildContext? context, required String text}) {
  return Text(
    text,
    style: Theme.of(context!).textTheme.caption!,
  );
}

Widget insideBodyText({required String text}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: HexColor('#505050'),
    ),
  );
}

ButtonStyle elevatedButtonStyleCustom(BuildContext context) =>
    ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      minimumSize: Size(MediaQuery.of(context).size.width, 40),
      padding: const EdgeInsets.symmetric(vertical: 15),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

String checkCardNumber(String cardnumber) {
  String number = "";

  final String stripped = cardnumber.replaceAll(RegExp(r'[^\d]'), '');
  if (stripped.length > 8) {
    final String middle = cardnumber.substring(4, 6).trim();
    final String middle1 = cardnumber
        .substring(6, cardnumber.length - 8)
        .trim()
        .replaceAll(RegExp(r'\d'), 'X');
    final String middle2 = cardnumber
        .substring(8, cardnumber.length - 4)
        .trim()
        .replaceAll(RegExp(r'\d'), 'X');
    number = stripped.substring(0, 4) +
        " " +
        middle +
        "" +
        middle1 +
        " " +
        middle2 +
        ' ' +
        stripped.substring(stripped.length - 4);
  }

  return number;
}

Future<String?> datePickerShowForBirthDay(BuildContext context,
    [String? dateFormate]) async {
  DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.blueAccent,
            ),
            textButtonTheme: const TextButtonThemeData(
                // style: TextButton.styleFrom(
                //   primary: Colors.w, // button text color
                // ),
                ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime(DateTime.now().year - 18),
      firstDate: DateTime(1950),
      lastDate: DateTime(DateTime.now().year - 18));

  if (pickedDate != null) {
    print(pickedDate);
    String formattedDate =
        DateFormat(dateFormate ?? 'yyyy-MM-dd').format(pickedDate);
    print(formattedDate);

    return formattedDate;
  } else {}
}


 // static void snackbarForErorr({
  //   required String titleText,
  //   required String bodyText,
  //   double? topMargin,
  // }) {
  //   Get.snackbar(titleText, bodyText,
  //       snackPosition: SnackPosition.TOP,
  //       margin: EdgeInsets.only(
  //           top: topMargin ?? Get.height * 0.0,
  //           left: Get.width * 0.05,
  //           right: Get.width * 0.05),
  //       backgroundColor: Get.theme.primaryColor,
  //       colorText: Colors.white);
  // }

  // static void snackbarForSucess({
  //   required String titleText,
  //   required String bodyText,
  //   double? topMargin,
  // }) {
  //   Get.snackbar(titleText, bodyText,
  //       snackPosition: SnackPosition.TOP,
  //       margin: EdgeInsets.only(
  //           top: topMargin ?? Get.height * 0.0,
  //           left: Get.width * 0.05,
  //           right: Get.width * 0.05),
  //       backgroundColor: fromHex('#65C7AF'),
  //       colorText: Colors.white);
  // }