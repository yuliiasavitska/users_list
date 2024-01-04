import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/list_of_users/list_of_users_page.dart';
import 'package:user_list/providers/users_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List of users',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => UsersProvider(),
        child: const ListOfUsersPage(),
      ),
    );
  }
}
