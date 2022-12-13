import 'package:flutter/material.dart';
import 'package:flutter_app/components/user_component.dart';
import '../fetchApi/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista desafio IPREMIOS'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiService().getPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            final List user = snapshot.data;
            return ListView(
              children: [
                ...user.map((p) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white70, elevation: 3),
                            onPressed: () {
                              Navigator.pushNamed( context , '/userpage', arguments: {
                                'name': p['first_name'],
                                'lastName': p['last_name'],
                                'email': p['email'],
                                'avatar': p['avatar']
                              });
                            },
                  child: ListTile(
                        title: UserComponents(p['id'], p['first_name'],
                            p['last_name'], p['email'], p['avatar']),
                      ),
                )),
              ],
            );
          }),
    );
  }
}
