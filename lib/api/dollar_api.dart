import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/Dollar.dart';

class DollarApi {
  static Future<List<Dollar>> getDollars() async {
    List<Dollar> listDollar = [];
    try {
      final url = Uri.https('www.dolarsi.com', '/api/api.php', {'type': 'valoresprincipales'});

      final response = await http.get(url).timeout(const Duration(seconds: 7));
      final bodyDecoded = json.decode(response.body);
      for (var json in bodyDecoded) {
        listDollar.add(Dollar.fromJSON(json['casa']));
      }

      listDollar.removeWhere((dollar) =>
          dollar.name == 'Dolar' ||
          dollar.name == 'Dolar Soja' ||
          dollar.name == 'Bitcoin' ||
          dollar.name == 'Dolar turista' ||
          dollar.name == 'Argentina');

    } catch (_) {}
    return listDollar;
  }
}
