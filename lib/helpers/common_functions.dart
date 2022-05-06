import 'package:intl/intl.dart';

class CommonFunctions {
  static String daysFromNow(DateTime date) =>
      DateTime.now().toUtc().difference(date).inDays.toString();

  static String numberAsCurrency(int number) {
    NumberFormat formatter =
        NumberFormat.currency(locale: 'es_CO', symbol: '\$', decimalDigits: 0);
    return formatter.format(number);
  }

  static String isOpenText(bool isOpen) => isOpen ? 'Abierto' : 'Cerrado';
}
