import 'dart:convert';

import 'package:flutter/material.dart';
import '../components/user_component.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

callApi() async {
  var client = http.Client();
  try {
    var response =
        await client.get(Uri.parse('https://reqres.in/api/users?page=1'));
    var res = jsonDecode(response.body);
    var resData = res['data'] as List;
    List<ObApi> obs = resData.map((e) => ObApi.fromJson(e)).toList();
    print(obs);
  } finally {
    client.close();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    callApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista desafio IPREMIOS'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          for (var i = 0; i < 6; i++)
            const Padding(
              padding: EdgeInsets.all(10),
              child: UserComponents(),
            )
        ],
      ),
    );
  }
}

class ObApi {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  ObApi({this.id, this.email, this.firstName, this.lastName, this.avatar});

  ObApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
  String toString() {
    return 'id : $email';
  }
}
