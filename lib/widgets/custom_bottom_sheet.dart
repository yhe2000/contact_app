import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/theme/app_theme.dart';
import 'package:contact_app/widgets/app_validator.dart';
import 'package:contact_app/widgets/custom_text_field.dart';
import 'package:contact_app/widgets/image_picker_widget.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  String? imagePicked;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController()
      ..addListener(() => setState(() {}));
    emailController = TextEditingController()
      ..addListener(() => setState(() {}));
    phoneController = TextEditingController()
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                ImagePickerWidget(
                  imagePicked: (path) {
                    setState(() {
                      imagePicked = path;
                    });
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameController.text.isEmpty
                              ? 'User Name'
                              : nameController.text,
                          style: AppTheme.mainTheme.textTheme.titleMedium,
                        ),
                        const Divider(
                          height: 20,
                          color: Color(0xffFFF1D4),
                        ),
                        Text(
                          emailController.text.isEmpty
                              ? 'example@email.com'
                              : emailController.text,
                          style: AppTheme.mainTheme.textTheme.titleMedium,
                        ),
                        const Divider(
                          height: 20,
                          color: Color(0xffFFF1D4),
                        ),
                        Text(
                          phoneController.text.isEmpty
                              ? '+200000000000'
                              : phoneController.text,
                          style: AppTheme.mainTheme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  hintText: "Enter User Name",
                  controller: nameController,
                  // fieldType: FieldType.name,
                  validator: (name) => AppValidator.namevalidator(name),
                ),
                CustomTextField(
                  hintText: "Enter User Email",
                  controller: emailController,
                  // fieldType: FieldType.email,
                  validator: (email) => AppValidator.emailvalidator(email),
                ),
                CustomTextField(
                  hintText: "Enter User Phone",
                  controller: phoneController,
                  // fieldType: FieldType.phone,
                  validator: (phone) => AppValidator.phonevalidator(phone),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final contact = ContactModel(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    imagePath: imagePicked,
                  );

                  Navigator.pop(context, contact);
                }
              },
              child: const Text('Enter User'),
            ),
          ),
        ],
      ),
    );
  }
}
