import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  final dynamic user;

  const UserDetails({required this.user});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Center(
        child: Container(child: Image.network(user['avatar_url'])),
      ),
    );
  }
}
