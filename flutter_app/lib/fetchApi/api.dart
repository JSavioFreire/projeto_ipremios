import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import '../main.dart';

class ApiService {
  Future getPosts() async {
    final posts = Hive.box(api).get('data', defaultValue: []);
    if (posts.isNotEmpty) return posts;
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    final resjson = jsonDecode(response.body);
    var resdata = resjson['data'] as List;
    Hive.box(api).put("data", resdata);
    return resdata;
  }
}
