import 'dart:convert';
import 'package:http/http.dart';

class ApiService {
  Map data;

  ApiService();

  void getData() async {
    try {
      Response response = await get('https://coronainfo.co.il/endpoint');
      final Map data = jsonDecode(response.body);
      List allCountries = data['allCountries'];
      allCountries.forEach((c) {
        if(c['country_name'] == "Israel"){
          data['israel'] = c;
        }
      });
      this.data = data;
    } catch (e) {
      print(e);
    }
  }
}
