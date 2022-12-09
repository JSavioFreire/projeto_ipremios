import 'package:flutter/material.dart';
import '../components/user_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



//Future fetch() async {
//  var url = Uri.parse('https://reqres.in/api/users?page=1');
//  var response = await http.get(url);
//  var json = jsonDecode(response.body);
//  return json['data'];
//}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
