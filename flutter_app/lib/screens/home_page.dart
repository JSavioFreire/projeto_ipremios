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
  ValueNotifier inLoader = ValueNotifier(false);

  callApi() async {
    var client = http.Client();
    try {
      inLoader.value = true;
      var response =
          await client.get(Uri.parse('https://reqres.in/api/users?page=1'));
      var res = jsonDecode(response.body);
      var resData = res['data'] as List;
      obs.value = resData.map((e) => ObApi.fromJson(e)).toList();
    } finally {
      client.close();
      inLoader.value = false;
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: Listenable.merge([obs, inLoader]),
              builder: (_, __) => inLoader.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: obs.value.length,
                      itemBuilder: (_, index) => ListTile(
                              title: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white70, elevation: 3),
                            onPressed: () {
                              Navigator.pushNamed(_, '/userpage', arguments: {
                                'name': obs.value[index].firstName,
                                'lastName': obs.value[index].lastName,
                                'email': obs.value[index].email,
                                'avatar': obs.value[index].avatar
                              });
                            },
                            child: UserComponents(
                                obs.value[index].id,
                                obs.value[index].firstName,
                                obs.value[index].lastName,
                                obs.value[index].email,
                                obs.value[index].avatar),
                          ))))
        ],
      ),
    );
  }
}
