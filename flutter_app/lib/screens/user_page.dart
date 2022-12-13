import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuário IPremios'),
      ),
      body: Container(
        width: double.infinity,
        height: 400,
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(arg['avatar']),
            ),
            Column(
              children: [
                Text(
                  '${arg['name']} ${arg['lastName']}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text('Email: ${arg['email']}',
                    style:
                        const TextStyle(fontSize: 20, color: Colors.black54)),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar para a tela inicial'))
          ],
        ),
      ),
    );
  }
}
