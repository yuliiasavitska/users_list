import 'package:flutter/material.dart';
import 'package:user_list/widgets/theme.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    Key? key,
    this.labelText,
    this.autofocus,
    this.focusNode,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.decoration,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  final String? labelText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final InputDecoration? decoration;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final regularBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: activeGreenColor, width: 2.0),
  );
  final errorBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: errorColor, width: 2.0),
  );

  String? errorMessage;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            onChanged: widget.onChanged,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            controller: widget.controller,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle:
                  const TextStyle(color: labelGreyColor, fontSize: 16.0),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              enabledBorder:
                  _isErrorNullOrEmpty() ? regularBorder : errorBorder,
              focusedBorder:
                  _isErrorNullOrEmpty() ? regularBorder : errorBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: errorBorder,
            ),
            validator: _validationListener,
            onSaved: widget.onSaved,
          ),
          const SizedBox(height: 4),
          if (errorMessage != null && errorMessage!.isNotEmpty)
            Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                errorMessage!,
                style: const TextStyle(fontSize: 12, color: errorColor),
              ),
            ),
        ],
      );

  String? _validationListener(String? value) {
    setState(() {
      errorMessage = widget.validator?.call(value);
    });

    return null;
  }

  bool _isErrorNullOrEmpty() => errorMessage == null || errorMessage!.isEmpty;
}
