import 'package:flutter/material.dart';

class UserComponents extends StatelessWidget {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  const UserComponents(
      this.id, this.firstName, this.lastName, this.email, this.avatar,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(avatar),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$firstName $lastName',
                  style: const TextStyle(fontSize: 19, color: Colors.black),
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
