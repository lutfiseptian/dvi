import 'package:intl/intl.dart';

class Helper {
  static String rupiahFormat(nominal) {
    NumberFormat currencyFormatterRp = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    String hasilFinal = "";
    hasilFinal = currencyFormatterRp.format(double.parse(nominal));
    return hasilFinal;
  }
}
