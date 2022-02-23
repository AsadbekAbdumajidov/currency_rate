import 'dart:convert';
import 'package:dollar_cursi/models/model.dart';
import 'package:http/http.dart' as http;

class KursServis {
  static Future<List<Kurs>> dollar() async {
    Uri url1 = Uri.parse('https://nbu.uz/uz/exchange-rates/json/');
    dynamic respo = await http.get(url1);
    return (jsonDecode(respo.body) as List)
        .map((e) => Kurs.fromJson(e))
        .toList();
  }
}