import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

class ProfileEditFormFieldFlex extends StatelessWidget {
  const ProfileEditFormFieldFlex({
    super.key,
    this.controller,
    required this.preIcon,
    this.fieldKey,
    this.labelText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    required this.isEnabled,
    this.initialValue,
    required this.widthPercentage,
  });
  final TextEditingController? controller;
  final IconData preIcon;
  final Key? fieldKey;
  final String? labelText;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final bool isEnabled;
  final double widthPercentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * widthPercentage,
        child: TextFormField(
          initialValue: initialValue,
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
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
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
