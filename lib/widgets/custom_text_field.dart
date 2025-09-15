import 'package:contact_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

//I first used an enum to handle validation logic inside the custom field widget,
// but I dropped the idea because it didn’t add much value.
//In the end, I would still need to pass a parameter either the field type or a validator function

//Which approach is more effective for a custom field widget using an enum or passing a validator?
//Let me know plz

// enum FieldType { name, email, phone }

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  // final FieldType fieldType;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    // required this.fieldType,
    required this.validator,
  });

  // String? validate(String? value) {
  //   switch (fieldType) {
  //     case FieldType.email:
  //       return AppValidator.emailvalidator(value);
  //     case FieldType.name:
  //       return AppValidator.namevalidator(value);
  //     case FieldType.phone:
  //       return AppValidator.phonevalidator(value);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: AppTheme.mainTheme.textTheme.titleMedium,
        decoration: InputDecoration(hintText: hintText),
      ),
    );
  }
}
