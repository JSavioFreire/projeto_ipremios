import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista desafio IPREMIOS'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'First_Name ' + 'Last_Name',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('E-mail', style: TextStyle(fontSize: 20))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
