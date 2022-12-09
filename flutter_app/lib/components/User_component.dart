import 'package:flutter/material.dart';

class UserComponents extends StatefulWidget {
  const UserComponents({super.key});

  @override
  State<UserComponents> createState() => _UserComponentsState();
}

class _UserComponentsState extends State<UserComponents> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
