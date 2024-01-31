import 'package:intl/intl.dart';

class Formatters {

  String currency(int amount){
    final currencyFormater = NumberFormat.currency(locale: 'id_ID',symbol: 'Rp.');
    return  currencyFormater.format(amount).toString().replaceAll(RegExp(r',00$'), '');
  }



}