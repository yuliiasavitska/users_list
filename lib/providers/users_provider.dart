import 'package:flutter/cupertino.dart';
import 'package:user_list/models/user_model.dart';

class UsersProvider extends ChangeNotifier {
  final List<UserModel> _generalListOfUsers = [];
  final List<UserModel> users = [];
  String _search = '';

  void onNewUser(final UserModel createdUser) {
    _generalListOfUsers.add(createdUser);
    search(_search);
    notifyListeners();
  }

  void search(String search) {
    _search = search;

    users.clear();

    final searchedUsers = _generalListOfUsers
        .where(
          (user) =>
              user.name
                  .toLowerCase()
                  .contains(_search.toLowerCase().toString()) ||
              user.surname
                  .toLowerCase()
                  .contains(_search.toLowerCase().toString()),
        )
        .toList();

    users.addAll(searchedUsers);
    notifyListeners();
  }

  bool isEmptyState() => _generalListOfUsers.isEmpty;
}
