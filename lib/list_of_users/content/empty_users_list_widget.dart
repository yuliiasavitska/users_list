import 'package:flutter/material.dart';
import 'package:user_list/widgets/theme.dart';

class EmptyUsersListWidget extends StatelessWidget {
  const EmptyUsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'The user list is empty.\n Please add users!',
            style: TextStyle(
              fontSize: 24,
              color: activeGreenColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
