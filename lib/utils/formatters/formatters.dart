import 'package:intl/intl.dart';

class HFormatter {
  HFormatter._();

  // datetime formatter
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  // curncyre formatter
  static String formatCurrency(double amount) {
    // customize the currency locale and symbol as needed
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  // phone number formatter

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming 10 digit US phone number format :(123) 456-7090
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)} ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)})';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)} ${phoneNumber.substring(3, 7)} ${phoneNumber.substring(7)})';
    }
    // add more logic if needed
    return phoneNumber;
  }
}
