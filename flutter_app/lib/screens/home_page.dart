import 'package:flutter/material.dart';
import 'package:flutter_app/components/user_component.dart';
import '../fetchApi/class_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier obs = ValueNotifier([]);

  callApi() async {
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.parse('https://reqres.in/api/users?page=1'));
      var res = jsonDecode(response.body);
      var resData = res['data'] as List;
      obs.value = resData.map((e) => ObApi.fromJson(e)).toList();
    } finally {
      client.close();
    }
  }

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
          ValueListenableBuilder(
              valueListenable: obs,
              builder: (_, value, __) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (_, index) => ListTile(
                      title: UserComponents(
                          value[index].id,
                          value[index].firstName,
                          value[index].lastName,
                          value[index].email,
                          value[index].avatar))))
        ],
      ),
    );
  }
}
