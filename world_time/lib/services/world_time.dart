import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;
  late bool isDaytime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url
  });

  Future<void> getTime() async {
    try {
      Uri uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour >= 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e) {
      print('Error: $e');
      time = 'Time data not available';
    }
  }
}