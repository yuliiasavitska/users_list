import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/providers/users_provider.dart';
import 'package:user_list/widgets/text_form_field_widget.dart';
import 'package:user_list/widgets/theme.dart';

class SearchUsersWidget extends StatefulWidget {
  const SearchUsersWidget({super.key});

  @override
  State<SearchUsersWidget> createState() => _SearchUsersWidgetState();
}

class _SearchUsersWidgetState extends State<SearchUsersWidget> {
  @override
  Widget build(BuildContext context) => TextFormFieldWidget(
        labelText: 'Search',
        prefixIcon: const Icon(Icons.search, color: labelGreyColor),
        onChanged: (search) => context.read<UsersProvider>().search(search),
      );
}
