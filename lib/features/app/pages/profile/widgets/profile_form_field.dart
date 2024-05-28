import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

class ProfileFormField extends StatelessWidget {
  const ProfileFormField(
      {super.key,
      this.controller,
      required this.preIcon,
      this.fieldKey,
      this.labelText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType,
      required this.isEnabled});
  final TextEditingController? controller;
  final IconData preIcon;
  final Key? fieldKey;
  final String? labelText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          style: const TextStyle(
            color: Colors.black,
          ),
          controller: controller,
          keyboardType: inputType,
          key: fieldKey,
          onSaved: onSaved,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          enabled: isEnabled ? true : false,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: EXColors.primaryDark,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: EXColors.disabledText,
                width: 2,
              ),
            ),
            labelText: labelText,
            fillColor: Colors.transparent,
            filled: true,
            prefixIcon: Icon(
              preIcon,
              color: EXColors.primaryDark,
            ),
            hintStyle: const TextStyle(color: Colors.black45),
          ),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
