import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/list_of_users/content/search_users_widget.dart';
import 'package:user_list/providers/users_provider.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final usersProvider = context.watch<UsersProvider>();
    final users = usersProvider.users;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const SearchUsersWidget(),
          const SizedBox(height: 24),
          users.isEmpty
              ? const Text(
                  'No users found!',
                  style: TextStyle(fontSize: 16),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: <Widget>[
                        Text(
                          '${index + 1}.',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          users[index].surname,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          users[index].name,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    );
                  },
                ),
        ],
      ),
    );
  }
}
