import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/add_user/add_user_page.dart';
import 'package:user_list/list_of_users/content/empty_users_list_widget.dart';
import 'package:user_list/list_of_users/content/users_list_widget.dart';
import 'package:user_list/models/user_model.dart';
import 'package:user_list/providers/users_provider.dart';
import 'package:user_list/widgets/app_bar_widget.dart';
import 'package:user_list/widgets/app_safe_area_widget.dart';
import 'package:user_list/widgets/theme.dart';

class ListOfUsersPage extends StatefulWidget {
  const ListOfUsersPage({super.key});

  @override
  State<ListOfUsersPage> createState() => _ListOfUsersPageState();
}

class _ListOfUsersPageState extends State<ListOfUsersPage> {
  @override
  Widget build(BuildContext context) {
    final usersProvider = context.watch<UsersProvider>();
    final isEmptyState = usersProvider.isEmptyState();
    final content =
        isEmptyState ? const EmptyUsersListWidget() : const UsersListWidget();

    return AppSafeAreaWidget(
      child: Column(
        children: [
          AppBarWidget(
            title: 'List of users',
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: ElevatedButton(
                  onPressed: () async {
                    final user = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddUserPage(),
                      ),
                    );

                    if (context.mounted && user is UserModel) {
                      context.read<UsersProvider>().onNewUser(user);
                    }
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(16),
                    fixedSize: MaterialStateProperty.all(const Size(88, 40)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: activeGreenColor),
                      ),
                    ),
                  ),
                  child: const Text('ADD'),
                ),
              ),
            ],
          ),
          content,
        ],
      ),
    );
  }
}
