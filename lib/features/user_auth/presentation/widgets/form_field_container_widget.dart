import 'package:explorexpert/features/user_auth/presentation/widgets/essentials.dart';
import 'package:flutter/material.dart';

class FormFieldContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const FormFieldContainerWidget({
    super.key,
    this.controller,
    this.isPasswordField,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
  });

  @override
  FormFieldContainerWidgetState createState() {
    return FormFieldContainerWidgetState();
  }
}

class FormFieldContainerWidgetState extends State<FormFieldContainerWidget> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.35),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          style: const TextStyle(
            color: Colors.black,
          ),
          controller: widget.controller,
          keyboardType: widget.inputType,
          key: widget.fieldKey,
          obscureText: widget.isPasswordField == true ? isObscureText : false,
          onSaved: widget.onSaved,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: EXColors.primaryDark,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blueGrey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            contentPadding: const EdgeInsets.all(15),
            labelText: widget.labelText,
            floatingLabelStyle: const TextStyle(
              color: EXColors.primaryDark,
              fontSize: 15,
              fontWeight: FontWeight.w800,
              letterSpacing: 3,
            ),
            hintText: widget.hintText,
            filled: true,
            hintStyle: const TextStyle(color: Colors.black45),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: widget.isPasswordField == true
                  ? Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                      color: isObscureText == false
                          ? EXColors.primaryDark
                          : Colors.grey,
                    )
                  : const Text(""),
            ),
          ),
        ),
      ),
    );
  }
}
