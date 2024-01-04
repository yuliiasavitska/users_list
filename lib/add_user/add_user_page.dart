import 'package:flutter/material.dart';
import 'package:user_list/models/user_model.dart';
import 'package:user_list/widgets/app_bar_widget.dart';
import 'package:user_list/widgets/app_safe_area_widget.dart';
import 'package:user_list/widgets/text_form_field_widget.dart';
import 'package:user_list/widgets/theme.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _validationRegExp = RegExp(r'^[A-Za-z ]+$');
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();

  final _nameFocus = FocusNode();
  final _surnameFocus = FocusNode();
  final _saveFocus = FocusNode();

  bool _isNameValid = false;
  bool _isSurnameValid = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();

    _nameFocus.dispose();
    _surnameFocus.dispose();
    _saveFocus.dispose();

    super.dispose();
  }

  void _fieldFocusChange(
    final BuildContext context,
    final FocusNode currentFocus,
    final FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return AppSafeAreaWidget(
      child: Column(
        children: [
          const AppBarWidget(title: 'Add a user'),
          Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: [
                const SizedBox(height: 12),
                TextFormFieldWidget(
                  labelText: 'Name',
                  prefixIcon: const Icon(Icons.person, color: labelGreyColor),
                  suffixIcon: GestureDetector(
                    onTap: () => _nameController.clear(),
                    child: const Icon(
                      Icons.delete_outline,
                      color: labelGreyColor,
                    ),
                  ),
                  focusNode: _nameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) =>
                      _fieldFocusChange(context, _nameFocus, _surnameFocus),
                  controller: _nameController,
                  validator: _validateName,
                ),
                const SizedBox(height: 20),
                TextFormFieldWidget(
                  labelText: 'Surname',
                  prefixIcon: const Icon(Icons.person, color: labelGreyColor),
                  suffixIcon: GestureDetector(
                    onTap: () => _surnameController.clear(),
                    child: const Icon(
                      Icons.delete_outline,
                      color: labelGreyColor,
                    ),
                  ),
                  focusNode: _surnameFocus,
                  onFieldSubmitted: (_) =>
                      _fieldFocusChange(context, _surnameFocus, _saveFocus),
                  controller: _surnameController,
                  validator: _validateSurname,
                ),
                const SizedBox(height: 28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      focusNode: _saveFocus,
                      onPressed: () => _save(context),
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(200, 60)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: activeGreenColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 24,
                          color: activeGreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _save(final BuildContext context) {
    _formKey.currentState?.validate();

    if (_isNameValid && _isSurnameValid) {
      Navigator.pop(
        context,
        UserModel(
          name: _nameController.text,
          surname: _surnameController.text,
        ),
      );
    }
  }

  String? _validateName(final String? value) {
    if (value == null || value.isEmpty) {
      _isNameValid = false;

      return 'Name is required';
    } else if (!_validationRegExp.hasMatch(value)) {
      _isNameValid = false;

      return 'Please enter alphabetical characters';
    } else {
      _isNameValid = true;

      return null;
    }
  }

  String? _validateSurname(final String? value) {
    if (value == null || value.isEmpty) {
      _isSurnameValid = false;

      return 'Surname is required';
    } else if (!_validationRegExp.hasMatch(value)) {
      _isSurnameValid = false;

      return 'Please enter alphabetical characters';
    } else {
      _isSurnameValid = true;

      return null;
    }
  }
}
